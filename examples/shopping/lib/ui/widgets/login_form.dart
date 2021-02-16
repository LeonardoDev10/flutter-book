import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
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
        )
      ],
    );
  }
}

