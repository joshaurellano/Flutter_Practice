import 'package:flutter/material.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'practice',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task Manager'),
        ),
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {

  List<String> tasks = [];
  final taskController = TextEditingController();

  void addTask() {
    setState(() {
      tasks.add(taskController.text);
      taskController.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Task'
            ),
            controller: taskController,
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: addTask, child: const Text('Add Task')
          ),
          SizedBox(height: 15),
          const Text('Active Tasks', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),),
          SizedBox(height: 15),
          
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.check_box_outline_blank),
                  title: Text(tasks[index]),
                  trailing: Icon(Icons.delete),
                );
              },
              itemCount: tasks.length,
          )
          )
        ],
      ),
    );

  }
}