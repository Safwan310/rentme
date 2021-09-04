import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index){
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
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
                          child: Padding(
                            padding: EdgeInsets.all(50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Image(image: CachedNetworkImageProvider("https://www.extremetech.com/wp-content/uploads/2019/12/SONATA-hero-option1-764A5360-edit.jpg"))

                                ),
                                Text("SHIT"),
                                Row(
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
                        ),
                      );
                    }
                ),
              )
          )
        ]
      ),
    );
  }
}
