import os

viewmodels_dir = "lib/viewmodels"
reports_dir = "lib/features/reports/presentation/screens"
os.makedirs(viewmodels_dir, exist_ok=True)
os.makedirs(reports_dir, exist_ok=True)

files = {
    "lib/viewmodels/report_viewmodel.dart": """import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/disaster_report_model.dart';
import '../core/providers/repository_providers.dart';

class ReportViewModel extends AsyncNotifier<List<DisasterReport>> {
  @override
  FutureOr<List<DisasterReport>> build() async {
    return ref.read(reportRepositoryProvider).getReports(0.0, 0.0);
  }

  Future<void> fetchReports(double lat, double lng) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(reportRepositoryProvider).getReports(lat, lng));
  }

  Future<void> submitReport(DisasterReport report) async {
    state = const AsyncValue.loading();
    await ref.read(reportRepositoryProvider).submitReport(report);
    // After submitting, refresh the list
    state = await AsyncValue.guard(() => ref.read(reportRepositoryProvider).getReports(0.0, 0.0));
  }
}

final reportViewModelProvider = AsyncNotifierProvider<ReportViewModel, List<DisasterReport>>(() {
  return ReportViewModel();
});
""",
    "lib/features/reports/presentation/screens/report_list_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../../viewmodels/report_viewmodel.dart';
import '../../../../shared/widgets/custom_card.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/custom_error_widget.dart';
import 'create_report_screen.dart';
import 'report_detail_screen.dart';

class ReportListScreen extends ConsumerStatefulWidget {
  const ReportListScreen({super.key});

  @override
  ConsumerState<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends ConsumerState<ReportListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(reportViewModelProvider.notifier).fetchReports(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reportState = ref.watch(reportViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Reports'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(reportViewModelProvider.notifier).fetchReports(0.0, 0.0);
        },
        child: reportState.when(
          data: (reports) {
            if (reports.isEmpty) {
              return const EmptyStateWidget(
                title: 'No Reports',
                message: 'There are no active disaster reports.',
                icon: Icons.list_alt,
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: reports.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final report = reports[index];
                return CustomCard(
                  type: CustomCardType.elevated,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ReportDetailScreen(report: report),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(
                        Icons.report_problem,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    title: Text(
                      report.type,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          report.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          DateFormat('MMM dd, yyyy - HH:mm').format(report.timestamp),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => CustomErrorWidget(
            message: err.toString(),
            onRetry: () => ref.read(reportViewModelProvider.notifier).fetchReports(0.0, 0.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CreateReportScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
""",
    "lib/features/reports/presentation/screens/create_report_screen.dart": """import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/report_viewmodel.dart';
import '../../../../models/disaster_report_model.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/custom_button.dart';

class CreateReportScreen extends ConsumerStatefulWidget {
  const CreateReportScreen({super.key});

  @override
  ConsumerState<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends ConsumerState<CreateReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  String _selectedType = 'Flood';
  String _selectedSeverity = 'High';

  final List<String> _disasterTypes = ['Flood', 'Earthquake', 'Fire', 'Storm', 'Other'];
  final List<String> _severities = ['Low', 'Medium', 'High', 'Critical'];

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submitReport() async {
    if (_formKey.currentState?.validate() ?? false) {
      final report = DisasterReport(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: _selectedType,
        description: _descController.text,
        severity: _selectedSeverity,
        locationId: 'loc_123',
        timestamp: DateTime.now(),
      );

      await ref.read(reportViewModelProvider.notifier).submitReport(report);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Report submitted successfully')),
        );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(reportViewModelProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Report'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Report an Incident',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Provide accurate information to help emergency responders.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 32),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Disaster Type',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
                items: _disasterTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedType = val);
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedSeverity,
                decoration: InputDecoration(
                  labelText: 'Severity',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
                items: _severities.map((sev) {
                  return DropdownMenuItem(
                    value: sev,
                    child: Text(sev),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedSeverity = val);
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Description',
                hint: 'Describe the incident in detail...',
                controller: _descController,
                validator: (v) => (v == null || v.isEmpty) ? 'Description is required' : null,
              ),
              const SizedBox(height: 24),
              Text(
                'Photo Evidence',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  // Mock photo upload
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_a_photo, size: 32, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: 8),
                        Text('Tap to add a photo', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Submit Report',
                isLoading: isLoading,
                onPressed: _submitReport,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
""",
    "lib/features/reports/presentation/screens/report_detail_screen.dart": """import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../models/disaster_report_model.dart';
import '../../../../shared/widgets/custom_button.dart';

class ReportDetailScreen extends StatelessWidget {
  final DisasterReport report;

  const ReportDetailScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    report.type.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'SEVERITY: \${report.severity.toUpperCase()}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Submitted on',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMMM dd, yyyy - HH:mm').format(report.timestamp),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 32),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              report.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 48),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_not_supported_outlined,
                      size: 48,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'No photo attached',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'View on Map',
              icon: const Icon(Icons.map),
              type: CustomButtonType.outline,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
"""
}

for filepath, content in files.items():
    with open(filepath, "w") as f:
        f.write(content)
