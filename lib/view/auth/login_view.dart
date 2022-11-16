import 'package:finin_focom/const/constant.dart';
import 'package:finin_focom/view_model/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: provider.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                kheight,
                TextFormField(
                  controller: provider.usernameInput,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 10) {
                      return 'must be 10 charecters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Username', border: OutlineInputBorder()),
                ),
                kheight,
                TextFormField(
                  controller: provider.passwordInput,
                  validator: (value) => provider.validation(value),
                  decoration: const InputDecoration(
                      hintText: 'Password', border: OutlineInputBorder()),
                ),
                kheight,
                ElevatedButton(
                  onPressed: () {
                    provider.onSubmit(context);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
