import 'package:flutter/material.dart';
// import 'package:first_flutter_app/home.dart';


void main() =>
  runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    const appTitle = "Mini Form";

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const CustomForm(),
      )
    );
  }
}

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() {
    return _MyAppState();
    }
}


class _MyAppState extends State<CustomForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
    final TextEditingController _messageTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(padding: EdgeInsets.all(16),
          child: TextFormField(
            controller: _nameTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Name'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            }
          ),
        ),

          Padding(
          padding: EdgeInsets.all(16),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: null,
            controller: _messageTextController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your Message'
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some message';
              }
              return null;
            }
          ),
        ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: ()  {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Column(
                        children: [
                          Text('Name: ${_nameTextController.text}'),
                          
                          Text('Message: ${_messageTextController.text}')
                        ],
                      ) 

                    // Text(_nameTextController.text),
                    // Text(_messageTextController.text)
                    )
                  );
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      )
    );
  }
}

