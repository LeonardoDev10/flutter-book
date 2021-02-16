import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

Widget _loginForm(GlobalKey<FormState> _formKey) {
  return Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Username'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        FlatButton(onPressed: null, child: Text('Submit'))
      ],
    ),
  );
}