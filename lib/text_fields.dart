import 'package:flutter/material.dart';

class TitleForm extends StatefulWidget {
  const TitleForm({super.key});

  @override
  State<TitleForm> createState() => _TitleForm();
}

class _TitleForm extends State<TitleForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: myController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter new task',
                fillColor: Colors.grey,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Add this task',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              String title = myController.text;
              Navigator.pop(context, title);
            },
          ),
        ],
      ),
    );
  }
}
