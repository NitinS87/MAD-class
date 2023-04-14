import 'package:flutter/material.dart';
import 'package:weather/model/form_data.dart';

class FormResult extends StatelessWidget {
  const FormResult({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Result')),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reg. No: ${user.regNo}'),
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Address: ${user.address}'),
            Text('Password: ${user.password}'),
            Text('Confirm Password: ${user.confirmPassword}'),
            Text('Dropdown: ${user.dropdown}'),
            Text('Semester Year: ${user.semYear}'),
          ],
        ),
      ),
    );
  }
}
