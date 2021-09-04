import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../theme.dart';
class UserQR extends StatefulWidget {
  final String userId;
  const UserQR({Key? key, required this.userId}) : super(key: key);

  @override
  _UserQRState createState() => _UserQRState();
}

class _UserQRState extends State<UserQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
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
            top: 60,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Text("Show this QR to the Lender to confirm the purchase",style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  QrImage(
                  data: widget.userId,
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),]
              ),
            )
          )
        ],
      ),
    );
  }
}
