import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ListedProductInfo.dart';
import 'package:rent_my_stuff/screens/ProductDetails.dart';



class ListedItem extends StatefulWidget {
  final String userId;
  const ListedItem({Key? key, required this.userId}) : super(key: key);

  @override
  _ListedItemState createState() => _ListedItemState();
}
class _ListedItemState extends State<ListedItem> {

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
  Future fetchProducts() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').where('ownerId', isEqualTo: widget.userId).get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    myProducts = allData;
    print(myProducts);
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listed Items"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 9 / 16,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40
              ),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListedProductInfo(imgUrl: myProducts[index]["image"],productName: myProducts[index]["productName"],productDesc: myProducts[index]["productDesc"],)));},
                  child: Container(
                    alignment: Alignment.center,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: CachedNetworkImage(
                              imageUrl: myProducts[index]["image"],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myProducts[index]["productName"],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  myProducts[index]["productPrice"],                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ]
                              ,
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
      ),
    );
  }
}
