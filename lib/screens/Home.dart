import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ProductDetails.dart';


class Home extends StatefulWidget {
  final String userId;
  const Home(this.userId) ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> myProducts =
  List.generate(10, (index) => {"id": index, "name": "Product $index"})
      .toList();
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchProducts().whenComplete(() {
          setState(){

          }
    });
  }
  late List<dynamic> allProducts;
  late String pId;
  Future fetchProducts() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('products').get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allProducts = allData;
    setState(() {

    });
    print(allData);
  }
  @override
  Widget build(BuildContext context) {
    if(allProducts == null){
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.red,),
        body: Text("LOADING......",style: TextStyle(color: Colors.white),),
      );
    }

    else{
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
          child: Column(
            children: [
              Text(
                "Rentme",
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border(
                            top: BorderSide(),
                            right: BorderSide(),
                            bottom: BorderSide(),
                            left: BorderSide()),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 165,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search for a product",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.search))
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.sort),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 9 / 16,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 40),
                    itemCount: allProducts.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      productId: allProducts[index]
                                          ["productId"])));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: CachedNetworkImage(
                                      imageUrl: allProducts[index]["image"],
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
                                        allProducts[index]["productName"],
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Text(
                                        allProducts[index]["productPrice"],
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
}
