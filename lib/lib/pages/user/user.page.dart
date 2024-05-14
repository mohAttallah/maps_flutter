import '../../Models/user.model.dart';
import './user.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _userController = UserController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userController.fetchUserData(1);
    _userController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final user = _userController.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(_userController.name ?? 'Default Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}'),
                  SizedBox(height: 8),
                  Text('Email: ${user.email}'),
                  SizedBox(height: 8),
                  Text('Email Verified At: ${user.emailVerifiedAt.toString()}'),
                  SizedBox(height: 8),
                  Text('Created At: ${user.createdAt.toString()}'),
                  SizedBox(height: 8),
                  Text('Updated At: ${user.updatedAt.toString()}'),
                  SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          initialValue: user.email,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  if (_userController.isEditing)
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter new name',
                      ),
                    ),
                  if (_userController.isEditing)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _userController.cancelEditing();
                          },
                          child: Text('Cancel'),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            _userController
                                .updateUserData(_nameController.text.trim());
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  if (!_userController.isEditing)
                    ElevatedButton(
                      onPressed: () {
                        _userController.startEditing();
                        _nameController.text = user.name;
                      },
                      child: Text('Edit'),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
