import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_todo_app/model/task.dart';
import 'package:flutter_todo_app/model/task_database.dart';

class FinishedTasksWidget extends StatefulWidget {
  const FinishedTasksWidget({Key? key, required this.database})
      : super(key: key);
  final Database database;

  @override
  State<FinishedTasksWidget> createState() => _FinishedTasksWidget();
}

class _FinishedTasksWidget extends State<FinishedTasksWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.database.finishedTasks);
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Finished tasks (Will be soon)'),
            ],
          ),
        ),
        body: SlidableAutoCloseBehavior(
          closeWhenOpened: true,
          child: ListView.builder(
            itemCount: widget.database.getFinishedTasks().length,
            itemBuilder: (context, index) {
              final task = widget.database.getDatabase()[index];
              return Slidable(
                child: buildCurrentWidget(task, index),
              );
            },
          ),
        ),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
