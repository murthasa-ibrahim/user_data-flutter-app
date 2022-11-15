import 'dart:developer';

import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{

final formKey = GlobalKey<FormState>();
final usernameInput = TextEditingController();
final passwordInput = TextEditingController();

//--------- Form validation ---------//
  String? validation(String? str){
  
       const pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(str??'')) {
      return 'Enter Valid Number';
    } else {
      return null;
    }
    
    
  }

  void onSubmit(){
    if(formKey.currentState!.validate()){
      log('validated');
    }
  }

}