import '../models/activity_model.dart';

/// Sumber data: menyimpan daftar aktivitas sementara dalam List.
class ActivityData {
  final List<ActivityModel> activities = [
    ActivityModel(id: 1, name: 'Push Up', counter: 10),
    ActivityModel(id: 2, name: 'Baca Buku', counter: 3),
    ActivityModel(id: 3, name: 'Minum Air (gelas)', counter: 5),
  ];

  int _lastId = 3;

  int nextId() => ++_lastId;
}
