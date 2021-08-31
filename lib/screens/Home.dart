import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String userId;
  const Home(this.userId) ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Homepage, user id is "+widget.userId),
    );
  }
}
