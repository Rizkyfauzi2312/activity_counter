import 'package:flutter/material.dart';
import '../viewmodels/activity_viewmodel.dart';
import 'activity_detail_view.dart';
import 'activity_form_view.dart';

class HomeView extends StatelessWidget {
  final ActivityViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  void _showMessage(BuildContext context, String? message) {
    if (message == null) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _open(BuildContext context, Widget page) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
    if (context.mounted) _showMessage(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Counter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          final items = viewModel.activities;
          if (items.isEmpty) {
            return const Center(child: Text('Belum ada aktivitas. Tekan + untuk menambah.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, i) {
              final a = items[i];
              return Card(
                child: ListTile(
                  title: Text(a.name,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Counter: ${a.counter}'),
                  onTap: () => _open(context,
                      ActivityDetailView(viewModel: viewModel, activityId: a.id)),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit',
                    onPressed: () => _open(context,
                        ActivityFormView(viewModel: viewModel, activityId: a.id)),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _open(context, ActivityFormView(viewModel: viewModel)),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }
}
