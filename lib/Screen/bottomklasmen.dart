import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../model/klasmen_response.dart';
import 'lihatsemua_klasemen.dart';

class BottomKlasmen extends StatefulWidget {
  const BottomKlasmen({Key? key}) : super(key: key);

  @override
  State<BottomKlasmen> createState() => _BottomKlasmenState();
}

class _BottomKlasmenState extends State<BottomKlasmen> {

  List<KlasemenResult> listdata = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      var response = await Dio().get("https://sapp-api.asyst.co.id/ticket-ext/v1/lib/standings",
        options: Options(headers: {HttpHeaders.authorizationHeader: "Bearer e03d553d-61e4-3859-8279-2dfea7d1c7fe"}),
      );
      print("REPONSE HEADER : ${response.statusCode}");
      KlasementResponse resp = KlasementResponse.fromJson(response.data);
      setState(() {
        listdata = resp.result!;
        isLoading = false;
        Future.delayed(Duration(seconds: 5));
      });
      print(resp.toJson());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          klasemen(listdata),
          SizedBox(height: 10),
          HeaderKlasemen(),
          Container(
            height: 440,
            child: isLoading? Center(child: CircularProgressIndicator()) : ListView.builder(
                shrinkWrap: true,
                itemCount: listdata.isNotEmpty ? 6: 0,
                itemBuilder: (context, index) {
                  KlasemenResult data = listdata[index];
                  return Klasement(data);
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget klasemen( List<KlasemenResult> listklasement) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(right: 14)),
          Text("Klasmen Liga Indonesia",
            style: TextStyle(fontSize: 22, color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 43),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LihatKlasemen(klasement: listklasement,)));
            },
            child: Text("Lihat Semua",
              style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget HeaderKlasemen() {
    return Container(
      margin: EdgeInsets.only(left: 19, right: 19),
      width: 360,
      height: 57,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        children: const <Widget>[
          Padding(padding: EdgeInsets.only(left: 15)),
          Text("POS",
            style: TextStyle(color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 21),
          Text("KLUB",
            style: TextStyle(color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 205),
          Text("POIN",
            style: TextStyle(color: Colors.white, fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget Klasement(KlasemenResult data) {
    return Column(
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(top: 11, left: 19, right: 19, bottom: 6),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(padding: const EdgeInsets.only(left: 25)),
              Container(
                width: 20,
                child: Text(data.nOURUT!,
                style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                  child: Row(
                    children: [
                      // Image.memory(Base64Decoder().convert(data.iDKLUB!),
                      // width: 15,
                      // height: 15,
                      // ),
                      SizedBox(width: 12),
                      Text(data.nAMATIM!,
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ),
              Container(
                width: 20,
                margin: EdgeInsets.only(right: 20),
                child: Text(data.nILAI!,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        Divider(height: 4),
      ],
    );
  }
}
