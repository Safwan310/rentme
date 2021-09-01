import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/Home.dart';

class App extends StatefulWidget {
  String _userId = "";
  App(String userId){
    _userId = userId;
  }

  @override
  _AppState createState() => _AppState(this._userId);
}

class _AppState extends State<App> {
  String _userId = "abc";
  List<Widget> _children = [];
  _AppState(String _userId){
    this._userId = _userId;
    _children = [
      Home(_userId),
      Home(_userId),
      Home(_userId)
    ];
  }
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Lend an Item",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
