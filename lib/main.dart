import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task.dart';
import 'package:flutter_todo_app/task_database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/task_adding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Database database = new Database();

  @override
  Widget build(BuildContext context) {
    //print('main build');
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: _buildAppBar(),
          body: TaskWidget(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskAddingScreen(
                      data: database,
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Flutter ToDo App',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}

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
    //print('widget build');
    for (Task t in database.getDatabase()) print(t.getTitle());

    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: ListView.builder(
        itemCount: database.getDatabase().length,
        itemBuilder: (context, index) {
          final task = database.getDatabase()[index];
          return Slidable(
            child: buildCurrentWidget(task, index),
            startActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Colors.green,
                  icon: Icons.done,
                  label: 'Finished',
                  onPressed: (context) => _onSlide(index, 'F'),
                ),
                SlidableAction(
                  backgroundColor: Colors.blue,
                  icon: Icons.archive,
                  label: 'Archive',
                  onPressed: (context) => _onSlide(index, 'A'),
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
                  onPressed: (context) => _onSlide(index, 'D'),
                ),
              ],
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
                        color: Colors.green,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Text(
                      task.getDescription(),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSlide(int index, String string) {
    final tasks = database.getDatabase();
    setState(() => tasks.removeAt(index));
  }
}
