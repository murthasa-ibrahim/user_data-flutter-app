import 'package:finin_focom/view/splash/splash.dart';
import 'package:finin_focom/view_model/add_user_provider.dart';
import 'package:finin_focom/view_model/home_provider.dart';
import 'package:finin_focom/view_model/login_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider(),),
       ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider(),),
       ChangeNotifierProvider<AddUserProvider>(create: (context) => AddUserProvider(),)   
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const Splash(),
      ),
    );
  }
}
