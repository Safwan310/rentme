import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/AddProduct.dart';
import 'package:rent_my_stuff/screens/App.dart';
import 'package:rent_my_stuff/screens/ListedItem.dart';
import 'package:rent_my_stuff/screens/loginPage.dart';
import 'package:rent_my_stuff/screens/registerPage.dart';
import 'package:rent_my_stuff/theme.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: ListedItem(),
    );
  }
}