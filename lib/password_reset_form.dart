import 'package:flutter/material.dart';
import 'package:weather/model/passwords.dart';

class PasswordResetFormField extends FormField<Passwords> {
  PasswordResetFormField({
    super.key,
    FormFieldSetter<Passwords>? onSaved,
    FormFieldValidator<Passwords>? validator,
    Passwords? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<Passwords> state) {
              return Container(
                child: Column(
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                      onChanged: (String value) {
                        state.value?.password = value;
                        state.didChange(state.value);
                      },
                    ),
                    TextField(
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                      onChanged: (String value) {
                        state.value?.confirmPassword = value;
                        state.didChange(state.value);
                      },
                    ),
                    state.hasError
                        ? Text(
                            state.errorText.toString(),
                            style: const TextStyle(color: Colors.red),
                          )
                        : Container()
                  ],
                ),
              );
            });
}
