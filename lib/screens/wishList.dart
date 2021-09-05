import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ProductDetails.dart';

import '../theme.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}
class _WishListState extends State<WishList> {
  List<dynamic>? wishList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishList().whenComplete(() {
      setState(){

      }
    });

  }
  Future getWishList() async {
    await FirebaseFirestore.instance.collection("user").doc(
        FirebaseAuth.instance.currentUser!.uid).get().then((value) => wishList = value.get("wishList"));
    setState(() {

    });
    print(wishList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist"),elevation: 0,),
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
              top: 20,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: wishList!.length,
                  itemBuilder: (BuildContext ctx, index){
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                           boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5), //color of shadow
                              spreadRadius: 5, //spread radius
                              blurRadius: 7, // blur radius
                              offset: Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            )]
                        ),
                        height: MediaQuery.of(context).size.height/5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width/3,
                                child: Image(image: CachedNetworkImageProvider(wishList![index]["productImage"])),
                                padding: EdgeInsets.all(10),
                            ),
                            Text(wishList![index]["productName"],style:Theme.of(context).textTheme.headline1!.copyWith(color:Colors.black87,fontSize:16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: secondary_color,
                                      elevation: 10.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0)),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(productId: wishList![index]["productId"],)));
                                    },
                                    child: Text(
                                      "Rent it",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(fontSize: 18, color: Colors.white),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
              )
          )
        ]
      ),
    );
  }
}
