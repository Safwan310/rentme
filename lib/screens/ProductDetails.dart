import 'package:flutter/material.dart';

import '../theme.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool selected = true;
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
                padding: EdgeInsets.all(95),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/vc.jpg'),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height/3,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(50,10,50,0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text("Product Name",style: Theme.of(context).textTheme.headline1,),
                          IconButton(onPressed: () {
                            setState(() {
                              selected = !selected;
                            });
                          }, icon: Icon( selected ? Icons.favorite_border_outlined : Icons.favorite,size: 35,color: secondary_color,))
                        ],
                      ),
                      SizedBox(height: 50),
                      Text("osidfh[oaewihrjoewihfaoijsdghoewithjwoeifhjopsaifgh",style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rental Price Rs.",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20)),
                            Text("5 Lakhs/day",style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),),

                          ]),
                      SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 60,
                    child: ElevatedButton(

                      child: Text("Rent It"),
                      style: ElevatedButton.styleFrom(
                        primary: secondary_color,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      ), onPressed: () {  },),
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
