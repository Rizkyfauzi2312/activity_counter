import '../data/activity_data.dart';
import '../models/activity_model.dart';

/// Mengelola akses dan manipulasi data.
class ActivityRepository {
  final ActivityData _data;

  ActivityRepository(this._data);

  List<ActivityModel> getAll() => List.unmodifiable(_data.activities);

  ActivityModel? getById(int id) {
    for (final a in _data.activities) {
      if (a.id == id) return a;
    }
    return null;
  }

  void add(String name) {
    _data.activities.add(ActivityModel(id: _data.nextId(), name: name));
  }

  void update(int id, String name) {
    final a = getById(id);
    if (a != null) a.name = name;
  }

  void delete(int id) {
    _data.activities.removeWhere((a) => a.id == id);
  }

  void updateCounter(int id, int value) {
    final a = getById(id);
    if (a != null) a.counter = value < 0 ? 0 : value;
  }
}
