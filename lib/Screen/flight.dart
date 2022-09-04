import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({Key? key}) : super(key: key);

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {

  bool valueSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () {}, icon: new Icon(Icons.arrow_back, color: Colors.white)
        // ),
        backgroundColor: Colors.lightBlue,
        title: Text("Flight",
          style: TextStyle(fontSize: 24, color: Colors.white
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: new Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.lightBlue,
            height: 60,
            child: Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 11, top: 1, bottom: 7),
                ),
                RaisedButton(
                    color: Colors.white,
                    child: Text(
                      "Sekali Jalan / Pulang-Pergi",
                      style: TextStyle(fontSize: 15, color: Colors.lightBlue),
                    ),
                    shape: StadiumBorder(),
                    onPressed: (){}
                ),
                Padding(padding: EdgeInsets.only(left: 15),
                ),
                RaisedButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Multi-City",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    shape: StadiumBorder(),
                    onPressed: (){}
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      textField(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 100),
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Image.asset("assets/icon/3.jpg",
              width: 3,
              height: 3,
            ),
            labelText: "Keberangkatan",
            hintText: "Jakarta (CGK)",
            hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
            labelStyle: TextStyle(fontSize: 16, color: Colors.blue),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30),
        ),
        TextFormField(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            prefixIcon: Image.asset("assets/icon/2.png",
              width: 2,
              height: 2,
            ),
            hintText: "Kedatangan",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 30),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 250,
              height: 55,
              child: TextFormField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  hintText: "Tanggal Keberangkatan",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 12)
            ),
            Column(
              children: <Widget>[
                Text("Pulang-Pergi?",
                  style: TextStyle(fontSize: 13, color: Colors.white60),
                ),
                Padding(padding: EdgeInsets.only(top: 5)
                ),
                Container(
                  child: CupertinoSwitch(
                    activeColor: Colors.lightBlueAccent,
                    trackColor: Colors.grey,
                    value: valueSwitched,
                      onChanged: (value) {
                      setState(() {
                        valueSwitched = value;
                      });
                      },
                  ),
                ),
              ],
            ),
            ],
        ),
        Padding(padding: EdgeInsets.only(top: 30),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 150,
              height: 55,
              child: TextFormField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.family_restroom),
                  hintText: "Penumpang",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15)
            ),
            Container(
              width: 150,
              height: 55,
              child: TextFormField(
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.meeting_room_outlined),
                  hintText: "Kelas",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 80),
        ),
        MaterialButton(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              height: 55,
              child: Text(
                "Mulai Pencarian",
                style: TextStyle(fontSize: 17, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: (){}
        ),
      ],
    );
  }
}
