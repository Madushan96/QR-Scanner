import 'dart:convert';

import 'package:http/http.dart' as http;
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
  String message = "";
  bool flag;

  markTeacherAttendance(String mac, String qrdata) async {
    String url = 'http://192.168.43.94:3000/teacher/mark-teacher-attendence';
    String userid = qrdata.split("=")[1].split("&")[0];
    String sequreid = qrdata.split("&")[1].split("=")[1];

    return http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {'macid': mac, 'sequreid': sequreid, 'teacherid': userid}));
  }

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
              message,
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
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
                markTeacherAttendance(mac, data);
                flag = true;

                setState(() {
                  qrData = data;
                  macAddress = mac;

                  if (flag) {
                    message = "Attendance Marked Successfully";
                  } else {
                    message = "Sorry, attendance couldn't mark";
                  }
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
