import 'package:flutter_todo_app/model/task.dart';

class Database {
  List<Task> list = [];
  List<Task> finishedTasks = [];

  Database() {
    list.add(new Task.name('Do a homework'));
    list.add(new Task.name('Clean a room'));
    list.add(new Task.name('Buy some food'));
  }

  List<Task> getDatabase() {
    return list;
  }

  List<Task> getFinishedTasks() {
    return finishedTasks;
  }

  List<String> getTitles() {
    List<String> titles = [];
    for (Task t in list) {
      titles.add(t.getTitle());
    }
    return titles;
  }

  void addTask(int index, String title) {
    list.insert(index, new Task.name(title));
  }

  void deleteTask(Task t) {
    list.remove(t);
  }
}
