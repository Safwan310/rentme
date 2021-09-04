import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/qrScan.dart';

import '../theme.dart';
class ListedProductInfo extends StatefulWidget {
  final String imgUrl,productName,productDesc;
  const ListedProductInfo({Key? key, required this.imgUrl,required this.productName,required this.productDesc}) : super(key: key);

  @override
  _ListedProductInfoState createState() => _ListedProductInfoState();
}

class _ListedProductInfoState extends State<ListedProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 80,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border(top: BorderSide(),right: BorderSide(),bottom: BorderSide(),
                      left: BorderSide()),
                  color: Colors.white,
                ),
              )),
          Positioned(
              top: 0,
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width/2,
              left: MediaQuery.of(context).size.width/4,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.imgUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),),),
          Positioned(
              top: MediaQuery.of(context).size.height/3,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(50,10,50,0),
                child: Container(
                  child: Column(
                    children: [
                      Text(widget.productName,style: Theme.of(context).textTheme.headline1,),
                      SizedBox(height: 50),
                      Text(widget.productDesc,style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(height: 50),
                      Container(
                        width: MediaQuery.of(context).size.width/2,
                        height: 60,
                        child: ElevatedButton(

                          child: Text("Scan QR and lend"),
                          style: ElevatedButton.styleFrom(
                            primary: secondary_color,
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                          ), onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context)=>QRScan(),)); },),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
