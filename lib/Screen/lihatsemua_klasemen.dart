import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screen/bottomklasmen.dart';
import 'package:project_1/model/klasmen_response.dart';

class LihatKlasemen extends StatefulWidget {
  final List<KlasemenResult> klasement;

  const LihatKlasemen({Key? key, required this.klasement}) : super(key: key);

  @override
  State<LihatKlasemen> createState() => _LihatKlasemenState();
}

class _LihatKlasemenState extends State<LihatKlasemen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => BottomKlasmen()));
            },
            icon: Icon(CupertinoIcons.back, color: Colors.white, size: 30)),
        title: Text("Klasemen Liga Indonesia"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22,
            fontWeight: FontWeight.w500),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          headerLihatSemua(),
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.klasement.length,
                  itemBuilder: (context, index) {
                    KlasemenResult data = widget.klasement[index];
                    return lihatklasemen(data);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerLihatSemua() {
    return Container(
      margin: EdgeInsets.only(top: 6, left: 5, right: 5),
      height: 54,
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 10)),
          Text("POS",
            style: TextStyle(color: Colors.white, fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text("KLUB",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 10,
            margin: EdgeInsets.only(right: 15),
            child: Text("M",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 10,
            margin: EdgeInsets.only(right: 15),
            child: Text("M",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 10,
            margin: EdgeInsets.only(right: 10),
            child: Text("S",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 10,
            margin: EdgeInsets.only(right: 10),
            child: Text("K",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 40,
            margin: EdgeInsets.only(right: 10),
            child: Text("GF-GA",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 20,
            margin: EdgeInsets.only(right: 7),
            child: Text("GD",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 25,
            margin: EdgeInsets.only(right: 5),
            child: Text("Pts",
              style: TextStyle(color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget lihatklasemen(KlasemenResult data) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 9, left: 5, right: 5),
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(data.nOURUT!,
                style: TextStyle(color: Colors.black, fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(data.nAMATIM!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 10,
                margin: EdgeInsets.only(right: 15),
                child: Text(data.mAIN!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 10,
                margin: EdgeInsets.only(right: 15),
                child: Text(data.mENANG!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 10,
                margin: EdgeInsets.only(right: 10),
                child: Text(data.sERI!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 10,
                margin: EdgeInsets.only(right: 10),
                child: Text(data.kALAH!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 40,
                margin: EdgeInsets.only(right: 10),
                child: Text(data.gOLKEMASUKAN!,
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 20,
                margin: EdgeInsets.only(right: 7),
                child: Text("GD",
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 25,
                margin: EdgeInsets.only(right: 5),
                child: Text("Pts",
                  style: TextStyle(color: Colors.black, fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 3),
      ],
    );
  }
}
