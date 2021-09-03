import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/App.dart';
import 'package:rent_my_stuff/screens/registerPage.dart';
import 'package:rent_my_stuff/backend/authentication';
import 'package:rent_my_stuff/backend/userinfo';

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
          padding: EdgeInsets.fromLTRB(30,150,30,0),
          child: Column(
            children: [
              Text("Login"),
              SizedBox(height: 160,),
              Form(
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
                        child: ElevatedButton( onPressed: (){
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
                         child: Text("Login")),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      }, child: Text("New User? Create Account")),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
