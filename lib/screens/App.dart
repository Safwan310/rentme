import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/AddProduct.dart';
import 'package:rent_my_stuff/screens/Home.dart';
import 'package:rent_my_stuff/screens/ProfilePage.dart';
import 'package:rent_my_stuff/theme.dart';

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
    return CupertinoTabScaffold(

      //body: _children[_currentIndex],
      tabBar: CupertinoTabBar(
        // onTap: onTabTapped,
        // currentIndex: _currentIndex,
        // backgroundColor: Colors.white,
        activeColor: secondary_color,
        inactiveColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              activeIcon: Icon(Icons.home,color: secondary_color,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Lend an Item",
            activeIcon: Icon(Icons.add,color: secondary_color,),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
            activeIcon: Icon(Icons.account_circle_outlined,color: secondary_color,),

          )
        ],
      ),
      tabBuilder: (context,index){
        switch(index){
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Home(_userId),
              );
            }
            );
          case 1:
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(
              child: AddProduct(),
            );
          }
          );
          case 2:
            print(_userId);
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(

                  child: profile(_userId),
              );
            }
            );
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(
                  child: Home(_userId),
                );
              }
              );
        }
      },
    );
  }
}
