import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/loginPage.dart';
import 'package:rent_my_stuff/backend/authentication';

import 'Home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formGlobalKey = GlobalKey < FormState > ();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _cpwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30,150,30,0),
          child: Column(
            children: [
              Text("Register"),
              SizedBox(height: 65,),
              Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [

                      TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                            labelText: "Username"
                        ),
                        validator: (uname){
                          if(uname!.isEmpty){
                            return 'Username cant be empty';
                          }
                        },
                      ),
                      SizedBox(height: 20,),
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
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _cpwd,
                        decoration: InputDecoration(
                            labelText: "Confirm Password"
                        ),
                        validator: (cpwd){
                          if(cpwd != _pwd.text){
                            return 'Passwords dont match';
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
                                .signUp(email: _email.text, password: _pwd.text)
                                .then((result) {
                              if (result == null) {
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final User? user = auth.currentUser;
                                final uid = user!.uid;
                                //print(user.toString()+"=="+uid);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => Home(uid)));
                              } else {

                              }
                            });
                          }
                        },
                            child: Text("Register")),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      }, child: Text("Already a user? Log in")),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
}}
