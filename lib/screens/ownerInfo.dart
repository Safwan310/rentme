import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class OwnerInfo extends StatefulWidget {
  final String userId;
  const OwnerInfo({Key? key,required this.userId}) : super(key: key);

  @override
  _OwnerInfoState createState() => _OwnerInfoState();
}

class _OwnerInfoState extends State<OwnerInfo> {
  Map<String, dynamic>? userDetails ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(widget.userId).whenComplete((){
      setState(() {

      });
    });
  }
  Future fetchData(String uid) async{
    await FirebaseFirestore.instance.collection("user").doc(uid).get().then((value) => userDetails = value.data()!);
  }
  @override
  Widget build(BuildContext context) {
    print(userDetails);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border(
                      top: BorderSide(),
                      right: BorderSide(),
                      bottom: BorderSide(),
                      left: BorderSide()),
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 40,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: secondary_color,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "M",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(userDetails!["userName"],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                    fontSize: 25, color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(userDetails!["email"],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                    fontSize: 20,
                                    color: Colors.black38)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(userDetails!["contactNo"],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                    fontSize: 20,
                                    color: Colors.black38)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Location: Coimbatore",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                    fontSize: 20,
                                    color: Colors.black38)),

                            SizedBox(
                              height: 90,
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 60,
                              child: ElevatedButton(
                                child: Text("Contact Owner"),
                                style: ElevatedButton.styleFrom(
                                  primary: secondary_color,
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0)),
                                ),
                                onPressed: () {

                                },
                              ),
                            )
                          ]))
                ],
              ),)
        ],
      ),
    );
  }
}
