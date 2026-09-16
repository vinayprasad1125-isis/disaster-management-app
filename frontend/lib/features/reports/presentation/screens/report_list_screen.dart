import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/reports_provider.dart';
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
      appBar: AppBar(title: const Text('Disaster Reports')),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(reportViewModelProvider.notifier)
              .fetchReports(0.0, 0.0);
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
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
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
                          DateFormat(
                            'MMM dd, yyyy - HH:mm',
                          ).format(report.timestamp),
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
            onRetry: () => ref
                .read(reportViewModelProvider.notifier)
                .fetchReports(0.0, 0.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const CreateReportScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
