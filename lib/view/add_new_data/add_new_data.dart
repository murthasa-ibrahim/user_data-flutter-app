import 'package:finin_focom/const/constant.dart';
import 'package:finin_focom/view_model/add_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewUser extends StatelessWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AddUserProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new user',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: provider.formKey,
          child: Column(
            children: [
              kheight,
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: provider.nameInput,
                validator: (value) => provider.validation(value),
                decoration: const InputDecoration(
                    hintText: 'name', border: OutlineInputBorder()),
              ),
              kheight,
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: provider.ageInput,
                validator: (value) => provider.validation(value),
                decoration: const InputDecoration(
                    hintText: 'age', border: OutlineInputBorder()),
              ),
              kheight,
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: provider.cityInput,
                validator: (value) => provider.validation(value),
                decoration: const InputDecoration(
                    hintText: 'city', border: OutlineInputBorder()),
              ),
              kheight,
              ElevatedButton(
                onPressed: () {
                  provider.onSubmit(context);
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
