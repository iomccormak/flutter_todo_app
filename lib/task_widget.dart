import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/task_adding_screen.dart';
import 'package:flutter_todo_app/model/task_database.dart';

class TaskWidget extends StatefulWidget {
  //const
  TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final Database database = new Database();

  @override
  Widget build(BuildContext context) {
    for (Task t in database.getDatabase()) print(t.getTitle());

    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: ListView.builder(
        itemCount: database.getDatabase().length,
        itemBuilder: (context, index) {
          final task = database.getDatabase()[index];
          return Dismissible(
            key: Key(index.toString()),
            child: Slidable(
              child: buildCurrentWidget(task, index),
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.green,
                    icon: Icons.done,
                    label: 'Finished',
                    onPressed: (context) => {
                      _finished(index),
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          closeIconColor: Colors.white,
                          showCloseIcon: true,
                          duration: Duration(seconds: 3),
                          content: Text(
                            task.getTitle() + ' is finished!',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    },
                  ),
                  SlidableAction(
                    backgroundColor: Colors.blue,
                    icon: Icons.add,
                    label: 'Add new',
                    onPressed: (context) => _add(index),
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: Colors.red,
                    icon: Icons.delete_rounded,
                    label: 'Delete',
                    onPressed: (context) => {
                      _delete(index),
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          closeIconColor: Colors.white,
                          showCloseIcon: true,
                          duration: Duration(seconds: 3),
                          content: Text(
                            task.getTitle() + ' is deleted',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildCurrentWidget(Task task, int index) {
    bool _check = false;

    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 67,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Text(
                      task.getTitle(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _finished(int index) {
    final tasks = database.getDatabase();
    final finishedTasks = database.getFinishedTasks();
    final finishedTask = database.getDatabase()[index];
    setState(() {
      finishedTasks.add(finishedTask);
      tasks.removeAt(index);
      print(database.getFinishedTasks());
    });
  }

  void _delete(int index) {
    final tasks = database.getDatabase();
    setState(() => tasks.removeAt(index));
  }

  void _add(int index) async {
    final data = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskAddingScreen(
            data: database,
          ),
        ));
    if (data != null) {
      setState(() {
        database.addTask(index, data);
      });
    }
    print(database.getTitles());
  }
}
