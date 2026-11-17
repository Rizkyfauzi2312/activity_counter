import 'package:flutter/material.dart';
import 'data/activity_data.dart';
import 'repositories/activity_repository.dart';
import 'viewmodels/activity_viewmodel.dart';
import 'views/home_view.dart';

void main() {
  runApp(const ActivityCounterApp());
}

class ActivityCounterApp extends StatefulWidget {
  const ActivityCounterApp({super.key});

  @override
  State<ActivityCounterApp> createState() => _ActivityCounterAppState();
}

class _ActivityCounterAppState extends State<ActivityCounterApp> {
  // Data -> Repository -> ViewModel dirakit di sini
  late final ActivityViewModel _viewModel =
      ActivityViewModel(ActivityRepository(ActivityData()));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomeView(viewModel: _viewModel),
    );
  }
}
