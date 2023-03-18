import 'package:flutter/material.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/task_database.dart';

class TaskAddingScreen extends StatelessWidget {
  final Database data;

  const TaskAddingScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
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
                /*Container(
            child: Text(
              'Adding new task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),*/
              ],
            ),
          ),
          body: _buildTextFields(),
        ),
      ),
    );
  }

  SingleChildScrollView _buildTextFields() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Title',
                fillColor: Colors.grey,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              maxLines: 15,
              decoration: InputDecoration(
                hintText: 'Description',
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
  }

  /* AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
              },
            ),
          ),
          /*Container(
            child: Text(
              'Adding new task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),*/
        ],
      ),
    );
  }*/
}
