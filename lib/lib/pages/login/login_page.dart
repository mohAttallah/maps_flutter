import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _isFormValid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              'Welcome to My Page!',
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: _formKey,
              onChanged: () {
                _isFormValid.value = _formKey.currentState!.validate();
              },
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isFormValid,
                    builder: (context, isFormValid, child) {
                      return ElevatedButton(
                        onPressed: isFormValid
                            ? () {
                                print("Form is valid");
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Hello from BottomSheet!',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            : null,
                        child: Text('Submit'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
