// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:weather/checkbox_form.dart';
import 'package:weather/form_result.dart';
import 'package:weather/model/form_data.dart';
import 'package:weather/model/passwords.dart';
import 'package:weather/password_reset_form.dart';

class MultiWidgetForm extends StatefulWidget {
  const MultiWidgetForm({Key? key}) : super(key: key);

  @override
  State<MultiWidgetForm> createState() => _MultiWidgetFormState();
}

class _MultiWidgetFormState extends State<MultiWidgetForm> {
  User user = User();

  var formKey = GlobalKey<FormState>();

  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  String year = "male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('MultiWidget Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: '',
                      onSaved: (String? value) {
                        print("Value: $value");
                        user.regNo = value!;
                        print(user.regNo);
                      },
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        print("Validating registered field...");
                        if (value!.isEmpty) {
                          return "Provide your Reg. No.";
                        }

                        return null; // successful validation
                      },
                      decoration:
                          const InputDecoration(labelText: "Registered No."),
                    ),
                    TextFormField(
                      initialValue: '',
                      onSaved: (String? value) {
                        print("Value: $value");
                        user.name = value!;
                        print(user.name);
                      },
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        print("Validating name field...");
                        if (value!.isEmpty) {
                          return "Provide your name";
                        }
                        if (value.length < 5) {
                          return "Name should be greater than 5";
                        }
                        return null; // successful validation
                      },
                      decoration: const InputDecoration(labelText: "Name"),
                    ),
                    PasswordResetFormField(
                      initialValue: Passwords(),
                      onSaved: (Passwords? passwords) {
                        print("Password: ${passwords?.password}");
                        user.password = passwords!.password;
                        user.confirmPassword = passwords.confirmPassword;
                        print(user.password);
                        print(user.confirmPassword);
                      },
                      validator: (Passwords? passwords) {
                        if (passwords!.nonEmpty()) {
                          if (passwords.match()) {
                            if (passwords.valid()) {
                              return "Passwords should be 8 characters long & write proper syntax";
                            }
                            return null;
                          }
                          return "Passwords should be same";
                        }
                        return "Passwords should not be empty";
                      },
                      autovalidateMode: AutovalidateMode.always,
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                        print(dropdownvalue);
                        user.dropdown = dropdownvalue;
                        print(user.dropdown);
                      },
                    ),
                    RadioListTile(
                      title: const Text("I"),
                      value: "I",
                      groupValue: year,
                      onChanged: (value) {
                        setState(() {
                          year = value.toString();
                        });
                        user.semYear = year;
                      },
                    ),
                    RadioListTile(
                      title: const Text("II"),
                      value: "II",
                      groupValue: year,
                      onChanged: (value) {
                        setState(() {
                          year = value.toString();
                        });
                        user.semYear = year;
                      },
                    ),
                    RadioListTile(
                      title: const Text("III"),
                      value: "III",
                      groupValue: year,
                      onChanged: (value) {
                        setState(() {
                          year = value.toString();
                        });
                        user.semYear = year;
                      },
                    ),
                    RadioListTile(
                      title: const Text("IV"),
                      value: "IV",
                      groupValue: year,
                      onChanged: (value) {
                        setState(() {
                          year = value.toString();
                        });
                        user.semYear = year;
                      },
                    ),
                    TextFormField(
                      initialValue: '',
                      onSaved: (String? value) {
                        print("Value: $value");
                        user.email = value!;
                        print(user.email);
                      },
                      // autovalidateMode: AutovalidateMode.always,
                      validator: (String? value) {
                        print("Validating email field...");
                        var regex =
                            RegExp(r"^[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+$");
                        if (!regex.hasMatch(value!)) {
                          return "Provide a valid email";
                        }
                        return null; // successful validation
                      },
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      initialValue: '',
                      // autovalidateMode: AutovalidateMode.always,
                      maxLength: 200,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      validator: (String? value) {
                        print("Validating address field...");
                        if (value!.isEmpty) {
                          return "Input your address";
                        }
                        return null; // successful validation
                      },
                      onSaved: (String? value) {
                        print("Value: $value");
                        user.address = value!;
                        print(user.address);
                      },
                      decoration: const InputDecoration(labelText: "Address"),
                    ),
                    CheckBoxFormField(
                      title: "I agree to change password",
                      onSaved: (bool? checked) {
                        print("Checkbox: $checked");
                      },
                      validator: (bool? value) {
                        return value! ? null : "You must check this";
                      },
                      autovalidateMode: AutovalidateMode.always,
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FormResult(user: user)));
                  }
                },
                child: const Text('Process'))
          ],
        ),
      ),
    );
  }
}
