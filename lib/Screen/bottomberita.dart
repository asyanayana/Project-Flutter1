import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_1/Screen/detailjadwal.dart';
import 'package:project_1/Screen/detailberita.dart';
import '../model/berita_response.dart';
import 'package:dio/dio.dart';
import 'lihatsemua_berita.dart';

class BottomBerita extends StatefulWidget {
  const BottomBerita({Key? key}) : super(key: key);

  @override
  State<BottomBerita> createState() => _BottomBeritaState();
}

class _BottomBeritaState extends State<BottomBerita> {

  List<NewsResult> beritaList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var response = await Dio().get("https://sapp-api.asyst.co.id/ticket-ext/v1/lib/news",
      options: Options(headers: {HttpHeaders.authorizationHeader: "Bearer e03d553d-61e4-3859-8279-2dfea7d1c7fe"}),
      );
      print("REPONSE HEADER : ${response.statusCode}");
      NewsResponse resp = NewsResponse.fromJson(response.data);
      setState(() {
        beritaList = resp.result!;
        isLoading = false;
        Future.delayed(Duration(seconds: 3));
      });
      print(resp.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        berita(beritaList),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 200,
          child: isLoading? Center(child: CircularProgressIndicator()) : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: beritaList.isNotEmpty ? 5 : 0,
              itemBuilder: (context, index) {
                NewsResult data = beritaList[index];
                return Berita(data);
                }
              ),
            ),
          ]
        );
      }

  Widget berita(List<NewsResult> listberita) {
    return Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(right: 14)),
        Text("Berita Liga Indonesia",
          style: TextStyle(fontSize: 22, color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 69),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LihatBerita(berita: listberita,)));
          },
          child: Text("Lihat Semua",
            style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
          ),
        ),
      ],
    );
  }

  Widget Berita(NewsResult data) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBerita(berita: data,)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 15),
        width: 153,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),

        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: Image.network(data.iMAGE!,
              height: 110,
              fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10, top: 14, right: 5),
              child: Text(data.tITLE!,
                style: TextStyle(fontSize: 13, color: Colors.blue,
                fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
