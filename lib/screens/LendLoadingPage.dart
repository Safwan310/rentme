import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/AddProduct.dart';

class LendLoadingPage extends StatefulWidget {
  const LendLoadingPage({Key? key}) : super(key: key);

  @override
  _LendLoadingPageState createState() => _LendLoadingPageState();
}

class _LendLoadingPageState extends State<LendLoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("Your product was successfully listed for rentals"),
            Container(
              height: 220.0,
              width: 220.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/check-animation.gif'),
                  fit: BoxFit.fitWidth,
                ),
                shape: BoxShape.circle,
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddProduct()));
            },
                child: Text("Add another item"),
            )
          ],
        ),
      ),
    );
  }
}
