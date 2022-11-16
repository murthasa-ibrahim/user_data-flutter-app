

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  final String name;
  final String age;
  final String city;

  UserData({required this.name,required this.age,required this.city});

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(name: json['name'], age: json['age'], city: json['city']);
  }

  factory UserData.fromDocument(DocumentSnapshot doc){
    final data = doc.data() as Map<String,dynamic>;
    return UserData.fromJson(data);
  }




}

List<UserData> userDataFromDocument(List<QueryDocumentSnapshot<Object?>> obj){
  return List<UserData>.from(obj.map((x)=> UserData.fromDocument(x)));
}

// List<UserData> userDataFromJson(String str) =>
//     List<UserData>.from(jsonDecode(str).map((x)=>UserData.fromJson(x)));


// factory Recipe.fromDocument(DocumentSnapshot doc) {
//     final data = doc.data()! as Map<String, dynamic>;
//     return Recipe.fromJson(data).copyWith(id: doc.id);
//   }