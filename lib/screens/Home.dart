import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_my_stuff/screens/ProductDetails.dart';
import 'package:rent_my_stuff/theme.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 70, 30, 30),
        child: Column(
          children: [
            Text("Rentme",style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white,),textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Container(

                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(top: BorderSide(),right: BorderSide(),bottom: BorderSide(),
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
                      IconButton(onPressed: (){}, icon: Icon(Icons.search))
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.sort),color: Colors.white,),
                ],

              ),

            ),
            Expanded(
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
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));},
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
          ],
        ),
      ),

    );
  }
}
