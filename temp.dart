import 'package:flutter/material.dart';

class DeclarativeTextFormFieldExample extends StatefulWidget {
  const DeclarativeTextFormFieldExample({super.key});

  @override
  State<DeclarativeTextFormFieldExample> createState() => _DeclarativeTextFormFieldExampleState();
}

class _DeclarativeTextFormFieldExampleState extends State<DeclarativeTextFormFieldExample> {

  var someText = '';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current text: $someText'),
        DeclarativeTextFormField(
      text: someText,
      onChanged: (value) {
        setState(() {
          someText = value;
        });
      },
    ),

    ElevatedButton(
      onPressed: () {
        setState(() {
          someText = 'Hello';
        });
      },
      child: Text('Change Text to "Hello"'),
    ),
      ],
    );
  }
}