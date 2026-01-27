import 'package:flutter/material.dart';
import 'package:first_flutter_app/home.dart';


void main() {
  runApp(const MaterialApp(
    home: Home()
  ));
}

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        backgroundColor: Colors.grey
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: const Text('One'),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            child: const Text('Two'),
          ),
          Container(
            height: 300,
            color: Colors.green,
            child: const Text('Three'),
          ),
        ],
      )
    );
  }
}
