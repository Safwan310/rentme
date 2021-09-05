import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/App.dart';
import 'package:rent_my_stuff/screens/registerPage.dart';
import 'package:rent_my_stuff/backend/authentication';
import 'package:rent_my_stuff/backend/userinfo';

import '../theme.dart';
import 'Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formGlobalKey = GlobalKey < FormState > ();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30,100,30,0),
          child: Column(
            children: [
              Text("Rent Me",style: Theme.of(context).textTheme.headline1!.copyWith(color:Colors.white,fontSize: 50),),
              SizedBox(height: 60,),
            Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 55, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      offset: Offset(0, 10),
                      blurRadius: 20)]
            ),
              child:Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            labelText: "Email"
                        ),
                        validator: (email){
                          if(email!.isEmpty){
                            return 'Enter a valid email';
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _pwd,
                        decoration: InputDecoration(
                            labelText: "Password"
                        ),
                        validator: (pwd){
                          if(pwd!.isEmpty){
                            return 'Password cant be empty';
                          }
                        },
                      ),
                      SizedBox(height: 65),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/1.2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: secondary_color,
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                            ),
                            onPressed: (){
                              if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // use the email provided here
                            AuthenticationHelper()
                                .signIn(email: _email.text, password: _pwd.text)
                                .then((result) {
                              if (result == null) {
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final uid = user!.uid;
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => App(uid)));
                              } else {

                              }
                            });
                            }
                            },
                         child: Text("Login",)),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      }, child: Text("New User? Create Account",style: Theme.of(context).textTheme.bodyText1!.copyWith(color: primary_color,fontWeight: FontWeight.bold),)),
                    ],
                  )
              )
            )],
          ),
        ),
      ),
    );
  }
}
