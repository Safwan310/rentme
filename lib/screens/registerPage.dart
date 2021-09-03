import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/loginPage.dart';
import 'package:rent_my_stuff/backend/authentication';
import 'package:rent_my_stuff/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import '../theme.dart';

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
  TextEditingController _contactNo = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _cpwd = TextEditingController();

  String? userId;

  @override
  Widget build(BuildContext context) {

    addData(){
      Map<String,dynamic> userData={'userName':_username.text,'email':_email.text,'contactNo':_contactNo.text};
      print(userId);
      FirebaseFirestore.instance.collection("user").doc(userId).set(userData);
      print(FirebaseFirestore.instance.collection("user").doc(userId));
      FirebaseFirestore.instance.collection("user").doc(userId).collection("rental_history").doc("rentalHistory");
    }

    return Scaffold(
      backgroundColor: primary_color,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30,50,30,0),
          child: Column(
            children: [
              Text("Register",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48,color: Colors.white),),
              SizedBox(height: 65,),
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
                child: Form(
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
                        // SizedBox(height: 20,),
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
                        TextFormField(
                          controller: _contactNo,
                          decoration: InputDecoration(
                              labelText: "Contact Number"
                          ),
                          validator: (num){
                            if(num!.isEmpty){
                              return 'Enter a valid number';
                            }
                          },
                        ),
                        // SizedBox(height: 20,),
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
                        // SizedBox(height: 20,),
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
                        SizedBox(height: 45),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width/1.5,
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
                                      .signUp(email: _email.text, password: _pwd.text)
                                      .then((result) {
                                    if (result == null) {
                                      final FirebaseAuth auth = FirebaseAuth.instance;
                                      final User? user = auth.currentUser;
                                      userId = user!.uid;
                                      //print(user.toString()+"=="+uid);
                                      addData();
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) => Home(userId!)));
                                    } else {

                                    }
                                  });
                                }

                              },

                              child: Text("Register",style: Theme.of(context).textTheme.button!.copyWith(fontSize:18,color: Colors.white),)),

                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        }, child: Text("Already a user? Log in",style: Theme.of(context).textTheme.bodyText1,)),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }}