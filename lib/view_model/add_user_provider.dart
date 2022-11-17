import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddUserProvider extends ChangeNotifier {
  final nameInput = TextEditingController();
  final ageInput = TextEditingController();
  final cityInput = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final users = FirebaseFirestore.instance.collection('Users');

  //--------- validation -------//

  String? validation(String? str) {
    if (str == null || str.isEmpty) {
      return "feild can't be null";
    } else {
      return null;
    }
  }

  Future<void> onSubmit(BuildContext context) async {
    log('clicked');
    if (formKey.currentState!.validate()) {
      log('1');
      await users.add({
        'name': nameInput.text,
        'age': ageInput.text,
        'city': cityInput.text
      }).then((value) => Navigator.of(context).pop());
      clearFeild();
    }
  }

  void clearFeild() {
    nameInput.clear();
    cityInput.clear();
    ageInput.clear();
  }
}
