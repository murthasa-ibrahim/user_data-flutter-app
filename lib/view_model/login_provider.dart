
import 'package:finin_focom/view/home/home_view.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();

//--------- Pssword validation ---------//
  String? validation(String? str) {
    const pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(str ?? '')) {
      return 'Enter Valid Number';
    } else {
      return null;
    }
  }

  void onSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView(),));
    }
  }
}
