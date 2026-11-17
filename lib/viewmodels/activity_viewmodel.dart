import 'package:flutter/foundation.dart';
import '../models/activity_model.dart';
import '../repositories/activity_repository.dart';

/// Logika aplikasi + state. Memberi tahu View lewat notifyListeners().
class ActivityViewModel extends ChangeNotifier {
  final ActivityRepository _repository;

  ActivityViewModel(this._repository);

  List<ActivityModel> get activities => _repository.getAll();

  ActivityModel? getById(int id) => _repository.getById(id);

  void addActivity(String name) {
    _repository.add(name.trim());
    notifyListeners();
  }

  void renameActivity(int id, String name) {
    _repository.update(id, name.trim());
    notifyListeners();
  }

  void deleteActivity(int id) {
    _repository.delete(id);
    notifyListeners();
  }

  void increment(int id) {
    final a = getById(id);
    if (a == null) return;
    _repository.updateCounter(id, a.counter + 1);
    notifyListeners();
  }

  void decrement(int id) {
    final a = getById(id);
    if (a == null || a.counter <= 0) return; // tidak boleh < 0
    _repository.updateCounter(id, a.counter - 1);
    notifyListeners();
  }

  void reset(int id) {
    _repository.updateCounter(id, 0);
    notifyListeners();
  }
}
