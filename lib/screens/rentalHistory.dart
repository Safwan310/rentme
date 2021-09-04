import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ProductDetails.dart';

class RentalHistory extends StatefulWidget {
  final String userId;
  const RentalHistory({Key? key,required this.userId}) : super(key: key);

  @override
  _RentalHistoryState createState() => _RentalHistoryState();
}

class _RentalHistoryState extends State<RentalHistory> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchProducts().whenComplete(() {
      setState(){

      }
    });
  }
  late List<dynamic> myProducts;
  dynamic someth;
  Future fetchProducts() async{
    DocumentReference documentReference = await FirebaseFirestore.instance.collection('user').doc(widget.userId);

    await documentReference.get().then((value) => someth = value.data());
    print(someth);
    // myProducts = allData;
    // print(myProducts);
    // setState(() {
    //
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rental History"),),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 9 / 16,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 40),
                  itemCount: someth["rentalHistory"].length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: CachedNetworkImage(
                                  imageUrl: someth["rentalHistory"][index]["productImage"],
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      someth["rentalHistory"][index]["productName"],
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    Text(
                                      "productPrice",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
