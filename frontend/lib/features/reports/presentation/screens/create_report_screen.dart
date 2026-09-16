import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reports_provider.dart';
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

  final List<String> _disasterTypes = [
    'Flood',
    'Earthquake',
    'Fire',
    'Storm',
    'Other',
  ];
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
      appBar: AppBar(title: const Text('Submit Report')),
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
                initialValue: _selectedType,
                decoration: InputDecoration(
                  labelText: 'Disaster Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
                items: _disasterTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedType = val);
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedSeverity,
                decoration: InputDecoration(
                  labelText: 'Severity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                ),
                items: _severities.map((sev) {
                  return DropdownMenuItem(value: sev, child: Text(sev));
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
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Description is required' : null,
              ),
              const SizedBox(height: 24),
              Text(
                'Photo Evidence',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.3),
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
                        Icon(
                          Icons.add_a_photo,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap to add a photo',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
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
