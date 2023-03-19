import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/finished_tasks.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/model/task_database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/task_adding_screen.dart';
import 'package:flutter_todo_app/task_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Database database = new Database();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: _buildAppBar(),
          body: TaskWidget(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.info_outline_rounded),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        showCloseIcon: true,
                        closeIconColor: Colors.white,
                        duration: Duration(seconds: 2),
                        content: Text(
                          'Slide tasks to see the actions',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    );
                  },
                  heroTag: null,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FinishedTasksWidget(
                          database: database,
                        ),
                      ),
                    );
                  },
                  heroTag: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Flutter ToDo App',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
    );
  }
}
