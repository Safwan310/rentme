import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ListedItem.dart';
import 'package:rent_my_stuff/theme.dart';

class profile extends StatefulWidget {
  final String userId;
  const profile(this.userId) ;

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
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
    if(userDetails == null){
      return Scaffold(
        body: Text("Loading"),
      );
    }
    else{
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
                top: 30,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
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
                              userDetails!["userName"][0],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(userDetails!["userName"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20, color: Colors.black)),
                                Text(userDetails!["email"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            color: Colors.black38)),
                                Text(userDetails!["contactNo"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 20,
                                            color: Colors.black38)),
                              ]))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      color: Colors.black38,
                                      style: BorderStyle.solid),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Wishlist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 20,
                                                color: Colors.black)),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      color: Colors.black38,
                                      style: BorderStyle.solid),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Rental History",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 20,
                                                color: Colors.black)),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListedItem()))
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      color: Colors.black38,
                                      style: BorderStyle.solid),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Listed Items",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 20,
                                                color: Colors.black)),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () => {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: BorderSide(
                                      color: Colors.black38,
                                      style: BorderStyle.solid),
                                  elevation: 10.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Show QR",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 20,
                                                color: Colors.black)),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      );
    }
  }
}
