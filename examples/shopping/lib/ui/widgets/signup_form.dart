import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

Widget _signUpForm(GlobalKey<FormState> _formKey) {
  return Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Username'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Password'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Re-type Password'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: 'E-mail'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: 'Celular'),
          validator: ValidationBuilder().email().maxLength(50).build(),
        ),
        SizedBox(height: 30),
        FlatButton(onPressed: null, child: Text('Submit'))
      ],
    ),
  );
}