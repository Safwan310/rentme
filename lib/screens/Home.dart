import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            Text("Rentme",style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
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
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.search))
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.sort)),
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
                      onTap: (){print('Hello'+myProducts[index]["name"]);},
                      child: Container(
                        alignment: Alignment.center,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/vc.jpg'),
                                        fit: BoxFit.fitHeight),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  myProducts[index]["name"],
                                  style: TextStyle(fontSize: 18.0),
                                )),
                          ],
                        ),
                          decoration: BoxDecoration(
                          color: Colors.amber,
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
