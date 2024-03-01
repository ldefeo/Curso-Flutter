

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {

  String user = '';
  String password = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  validateForm() {

    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;

  }


}