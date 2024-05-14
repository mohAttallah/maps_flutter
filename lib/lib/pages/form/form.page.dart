import 'package:delivary_app/lib/pages/user/user.page.dart';
import 'package:flutter/material.dart';

class FromPage extends StatefulWidget {
  @override
  _MyFromState createState() => _MyFromState();
}

class _MyFromState extends State<FromPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Help Page'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedValue,
                      items: ['Option 1', 'Option 2', 'Option 3']
                          .map((label) => DropdownMenuItem(
                                child: Text(label),
                                value: label,
                              ))
                          .toList(),
                      hint: Text('Select an option'),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                    MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Form is valid');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage()),
                            );
                          } else {
                            print('Form is invalid');
                          }
                        },
                        child: Text('Submit'))
                  ],
                ))),
      ),
    );
  }
}
