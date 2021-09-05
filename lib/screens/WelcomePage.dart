import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_my_stuff/screens/registerPage.dart';
import 'package:rent_my_stuff/theme.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,100,30,30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Center(
              child: Text("Welcome to RentMe",
                textAlign: TextAlign.center,
                style: GoogleFonts.dancingScript(
                  fontSize: 40,
                  color: primary_color,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height:30),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: secondary_color,
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              ),
              child: Text("Get Started",style: Theme.of(context).textTheme.button!.copyWith(fontSize:18,color: Colors.white),),
              onPressed: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
              }),
            )
          ],
        ),
      ),
    );
  }
}
