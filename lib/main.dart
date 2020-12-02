import 'package:flutter/material.dart';
import 'package:qrScanner/scanPage.dart';

void main() {
  runApp(QRApp());
}

//This is the main application
class QRApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColorDark: Colors.black26,
        primarySwatch: Colors.deepOrange,
      ),
      routes: <String, WidgetBuilder>{
        'scanpage': (context) => Scanner(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//This is the first page loaded
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text(
                "Welcome to MySchool App",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 120.0,
                child: Image.asset("assets/qr.png"),
              ),
              SizedBox(
                height: 90,
              ),
              scanButton(context),
            ],
          ),
        ),
      ),
    );
  }
}

//This is the scanQR button
Widget scanButton(context) {
  return FlatButton(
    onPressed: () {
      Navigator.of(context).pushNamed('scanpage');
    },
    child: Text(
      "Scan QR",
      style: TextStyle(fontSize: 25.0, color: Colors.white),
    ),
    color: Colors.deepOrange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  );
}
