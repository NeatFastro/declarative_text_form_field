import 'package:flutter/material.dart';
import 'package:declarative_text_form_field/declarative_text_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Declarative Text Form Field Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _companyName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            children: [
              SizedBox(height: 48),
              Text('Company Name: $_companyName'),
              SizedBox(height: 16),
              CustomTextFormField(
                text: _companyName,
                onChanged: (value) {
                  setState(() {
                    _companyName = value;
                  });
                },
              ),
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _companyName = 'Statelysoft';
                  });
                },
                child: Text('Change Company Name to "Statelysoft"'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
