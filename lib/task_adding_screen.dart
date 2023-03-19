import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/task_database.dart';
import 'package:flutter_todo_app/text_fields.dart';

class TaskAddingScreen extends StatelessWidget {
  final Database data;

  const TaskAddingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        body: TitleForm(),
      ),
    );
  }

  /*SingleChildScrollView _buildTextFields() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'New task is...',
                fillColor: Colors.grey,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Add this task',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }*/
}
