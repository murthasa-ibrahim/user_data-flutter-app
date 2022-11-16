

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';

class HomeProvider extends ChangeNotifier {
  String? selectedMenu;
  void addToSelectedMenu(String item) {
    selectedMenu = item;
    notifyListeners();
  }

void sort(int type){
  usersList.sort(sorts[type]);
  notifyListeners();
}

  List<int Function(UserData, UserData)> sorts = [
    (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    (a, b) => a.age.compareTo(b.age),
    (a, b) => a.city.toLowerCase().compareTo(b.city.toLowerCase())
  ];

  List<UserData> usersList = [];

//--------- Firebase -----------//

FirebaseFirestore firestore = FirebaseFirestore.instance;
 final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('Users').snapshots();
//  final  users = FirebaseFirestore.instance.collection('Users');
  // Future<void> addUser() {
     
  //     return users
  //         .add({
  //           'name': "mur", 
  //           'age': '22', 
  //           'city': 'clt' 
  //         })
  //         .then((value) => log("User Added"))
  //         .catchError((error) => log("Failed to add user: $error"));
  //   }
    


}
