import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:rent_my_stuff/screens/LendLoadingPage.dart';

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
  List<File> selectedImages = [];
  Future<String>? imgUrl;

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  void addProduct(){
    String p_id = FirebaseFirestore.instance.collection("products").doc().id;
    print(p_id);
    setState(() {

    });
    String userId = FirebaseAuth.instance.currentUser!.uid;
    print(userId);
    if(imgUrl == null){

    }
    Map<String, dynamic> product = {"productId":p_id,"productName":_productName.text,"productDesc":_productDesc.text,"productPrice":_productPrice.text,"image":imgUrl.toString(),"userId":userId};
    FirebaseFirestore.instance.collection("products").doc(p_id).set(product);
  }

  Future uploadImageToFirebase(BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("Img" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(selectedImages[0]);
    await uploadTask.whenComplete(() => imgUrl = ref.getDownloadURL());
    print(imgUrl);
      }
    // await uploadTask.then((res){
    //   res.ref.getDownloadURL().then((value)=> imgUrl = value);
    // });
    // setState(() {
    //
    // });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lend an item"),
          elevation: 0.0,
        ),
        body: Stack(children: [
          Positioned(
              top: 10,
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
              top: 30,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _productName,
                          decoration: InputDecoration(
                              labelText: "Enter product name",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: primary_color, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: secondary_color,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _productDesc,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          maxLines: 5,
                          decoration: InputDecoration(
                              labelText: "Enter product description",
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: primary_color, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: secondary_color,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              ) // Added this
                              //contentPadding: EdgeInsets.all(50),
                              // Added this
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        selectedImages.length == 0
                            ? addImageButton()
                            : selectedImageWidgets(),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _productPrice,
                          decoration: InputDecoration(
                              labelText: "Enter product price per day",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: primary_color, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: secondary_color,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "Enter Listing Location",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: primary_color, style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: secondary_color,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: secondary_color,
                                elevation: 10.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                              ),
                              onPressed: () async{
                                await uploadImageToFirebase(context);
                                addProduct();
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LendLoadingPage()));
                              },
                              child: Text(
                                "Lend",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(fontSize: 18, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              )
        ]));
  }

  Widget addImageButton() {
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.hardEdge,
      child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(minHeight: 70),
          decoration: BoxDecoration(
            border: Border.all(color: primary_color, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.photo),
                            title: new Text('Gallery'),
                            onTap: () async {
                              Navigator.pop(context);
                              FilePickerResult? images =
                                  await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                      allowMultiple: true);
                              if (images != null) {
                                setState(() {
                                  selectedImages = images.paths
                                      .map((path) => File(path!))
                                      .toList();

                                });
                              }
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.camera),
                            title: new Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              _handleURLButtonPress(
                                  context, ImageSourceType.camera);

                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.add),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text("Add Images"),
              )
            ]),
          )),
    );
  }

  Widget selectedImageWidgets() {
    return Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(minHeight: 70, maxHeight: 90),
        decoration: BoxDecoration(
          border: Border.all(color: primary_color, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
            constraints: BoxConstraints(minHeight: 70, maxHeight: 150),
            child: ListView(
                children: List.generate(selectedImages.length, (index) {
              File image = selectedImages[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                      border: Border.all(color: primary_color),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(image.path.split('/').last,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle()),
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                              child: Icon(Icons.delete),
                              onTap: () => setState(
                                  () => selectedImages.removeAt(index))))
                    ],
                  ),
                ),
              );
            }))));
  }
}
