import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
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
  final formKey = GlobalKey <FormState>();
  

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
          Form(
            key: formKey,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Task'
              ),
              controller: taskController,
              validator: (value) {
                if (value == null || value.isEmpty){
                  return 'Field cannot be empty';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              if(formKey.currentState !.validate()){
                addTask();
              }
            },
            child: const Text('Add Task')
          ),
          SizedBox(height: 15),
          const Text('Active Tasks', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),),
          SizedBox(height: 15),
          
          Expanded(
            child: tasks.isEmpty ? Center(
              child: const Text('Hooray!! No tasks available as of the moment')) : 
              
              ListView.builder(
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