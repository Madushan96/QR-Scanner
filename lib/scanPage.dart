import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:get_mac/get_mac.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrData = "Not yet scanned";
  String macAddress = "Mac is not detected yet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Result",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              qrData,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              macAddress,
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: () async {
                String data = await BarcodeScanner.scan();
                String mac = await GetMac.macAddress;
                setState(() {
                  qrData = data;
                  macAddress = mac;
                });
              },
              child: Text(
                "Scan Now",
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
