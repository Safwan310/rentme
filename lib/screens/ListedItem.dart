import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ListedProductInfo.dart';
import 'package:rent_my_stuff/screens/ProductDetails.dart';



class ListedItem extends StatefulWidget {
  const ListedItem({Key? key}) : super(key: key);

  @override
  _ListedItemState createState() => _ListedItemState();
}
final List<Map> myProducts =
List.generate(10, (index) => {"id": index, "name": "Product $index"})
    .toList();
class _ListedItemState extends State<ListedItem> {
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
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListedProductInfo()));},
                  child: Container(
                    alignment: Alignment.center,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              padding: EdgeInsets.all(95),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/vc.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            )),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  myProducts[index]["name"],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(fontSize: 18.0),
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
