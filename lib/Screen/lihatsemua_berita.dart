import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screen/detailberita.dart';
import 'package:project_1/model/berita_response.dart';
import 'bottomberita.dart';
import 'package:html/parser.dart';


class LihatBerita extends StatefulWidget {
  final List<NewsResult> berita;

  const LihatBerita({Key? key, required this.berita}) : super(key: key);

  @override
  State<LihatBerita> createState() => _LihatBeritaState();
}

class _LihatBeritaState extends State<LihatBerita> {

  String? parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString = parse(document.body?.text).
    documentElement?.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => BottomBerita()));
            },
            icon: Icon(CupertinoIcons.back, color: Colors.white, size: 30)),
        title: Text("Berita Liga Indonesia"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22,
            fontWeight: FontWeight.w500),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 1),
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.berita.length,
            itemBuilder: (context, index) {
              NewsResult data = widget.berita[index];
              return LihatSemua(data);
            }
        ),
      ),
    );
  }

  Widget LihatSemua(NewsResult data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBerita(berita: data)));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: 128,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 9),
                    width: 50,
                    child: Column(
                      children: [
                        // Padding(padding: EdgeInsets.only(top: 5)),
                        Text(data.tITLE!, style: TextStyle(fontSize: 15, color: Colors.blue,
                          fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 7),
                        Container(
                          margin: EdgeInsets.only(right: 175),
                          child: Text(data.pUBLISHDATE!, style: TextStyle(
                              color: CupertinoColors.systemGrey, fontSize: 10),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(parseHtmlString(data.dESC!)!, style: TextStyle(fontSize: 15,
                            color: Colors.black),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ]
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, right: 10, bottom: 20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.iMAGE!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1.5),
        ],
      ),
    );
  }
}
