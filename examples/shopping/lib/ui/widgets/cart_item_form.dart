import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

Widget _cartItemForm(GlobalKey<FormState> _formKey) {
  return Form(
    key: _formKey,
    child: Row(
      children: [
        Text('Product name'),
        TextFormField(
          validator: ValidationBuilder().minLength(1).maxLength(3).build(),
        ),
      ],
    )
  );
}