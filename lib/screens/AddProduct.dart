import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import 'ImageFromGalleryEx.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _productName = TextEditingController();
  TextEditingController _productDesc = TextEditingController();
  TextEditingController _productPrice = TextEditingController();

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lend an item"),
        elevation: 0.0,
    ),
    body: Stack(
    children: [
    Positioned(
        top: 10,
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
          top: 30,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _productName,
                  decoration: InputDecoration(
                    labelText: "Enter product name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary_color,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondary_color,style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(20),
                    )

                    ),
                ),
                SizedBox(height: 40,),
                TextField(
                  controller: _productDesc,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Enter product description",
                    isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary_color,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondary_color,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      )// Added this
                    //contentPadding: EdgeInsets.all(50),
                   // Added this
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,

                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      textStyle:MaterialStateProperty.all(TextStyle(color: Colors.black)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: primary_color)
                          ),
                    ),),
                    
                    icon: Icon(Icons.add,color: Colors.black,),
                    label: Text('Add Images',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.black),),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height/4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    leading: new Icon(Icons.photo),
                                    title: new Text('Gallery'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _handleURLButtonPress(context, ImageSourceType.gallery);
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.camera),
                                    title: new Text('Camera'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _handleURLButtonPress(context, ImageSourceType.camera);
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ),
                SizedBox(height: 40,),
                TextField(
                  controller: _productPrice,
                  decoration: InputDecoration(
                    labelText: "Enter product price per day",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primary_color,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: secondary_color,style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondary_color,
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                      ),
                      onPressed: (){},

                      child: Text("Lend",style: Theme.of(context).textTheme.button!.copyWith(fontSize:18,color: Colors.white),)),

                ),
              ],
            ),
          )
      )
    ]));
  }
}
