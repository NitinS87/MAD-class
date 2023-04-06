import 'package:flutter/material.dart';
import 'package:weather/checkbox_form.dart';
import 'package:weather/model/passwords.dart';
import 'package:weather/password_reset_form.dart';

class MultiWidgetForm extends StatefulWidget {
  const MultiWidgetForm({Key? key}) : super(key: key);

  @override
  State<MultiWidgetForm> createState() => _MultiWidgetFormState();
}

class _MultiWidgetFormState extends State<MultiWidgetForm> {
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
      body: Column(
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
                    },
                    validator: (Passwords? passwords) {
                      if (passwords!.nonEmpty()) {
                        if (passwords.match()) {
                          if (passwords.valid()) {
                            return null;
                          }
                          return "Passwords should be 8 characters long";
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
                    },
                  ),
                  TextFormField(
                    initialValue: '',
                    onSaved: (String? value) {
                      print("Value: $value");
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
                }
              },
              child: const Text('Process'))
        ],
      ),
    );
  }
}
