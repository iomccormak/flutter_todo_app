import 'package:flutter_todo_app/task.dart';

class Database {
  List<Task> list = [];

  Database() {
    list.add(new Task.name('Do a homework', 'Do some homework and labs'));
    list.add(new Task.name('Clean a room', 'Its really dirty there'));
    list.add(new Task.name('Do some shit', 'I have no fantasy'));
    list.add(new Task.name('1', 'Do some homework and labs'));
    list.add(new Task.name('another', 'oooooooooooooo'));
    list.add(new Task.name('Do a homework', 'Do some homework and labs'));
    list.add(new Task.name('Clean a room', 'Its really dirty there'));
    list.add(new Task.name('Do some shit', 'I have no fantasy'));
    list.add(new Task.name('1', 'Do some homework and labs'));
    list.add(new Task.name('another', 'oooooooooooooo'));
    list.add(new Task.name('Clean a room', 'Its really dirty there'));
    list.add(new Task.name('Do some shit', 'I have no fantasy'));
    list.add(new Task.name('1', 'Do some homework and labs'));
    list.add(new Task.name('another', 'oooooooooooooo'));
  }

  List<Task> getDatabase() {
    return list;
  }

  void deleteTask(Task t) {
    list.remove(t);
  }
}
