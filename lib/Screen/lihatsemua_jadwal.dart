import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_1/Data/jadwal.dart';

import '../model/jadwal_request.dart';
import '../model/jadwal_response.dart';

class LihatJadwal extends StatefulWidget {
  final List<JadwalResponseData> jadwal;
  final bool isLoading;

  const LihatJadwal({Key? key, required this.jadwal, required this.isLoading}) : super(key: key);

  @override
  State<LihatJadwal> createState() => _LihatJadwalState();
}

class _LihatJadwalState extends State<LihatJadwal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Jadwal Pertandingan"),
        titleTextStyle: TextStyle(color: Colors.black, fontSize:22,
        fontWeight: FontWeight.w400),
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: CupertinoColors.systemGrey, size: 26),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 5),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert,
                color: Colors.black54)),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: widget.isLoading? Center(child: CircularProgressIndicator()) : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.jadwal.length,
                  itemBuilder:  (context, index) {
                    JadwalResponseData data = widget.jadwal[index];
                    return lihatJadwal(data);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget lihatJadwal(JadwalResponseData data) {
    return Column(
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            Container(
              width: 50,
              child: Image.memory(Base64Decoder().convert(data.homeIcon!),
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(width: 6),
            Text(data.home!, style: TextStyle(color: Colors.black,
            fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            Container(
              width: 50,
              child: Image.memory(Base64Decoder().convert(data.awayIcon!),
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Text(data.away!, style: TextStyle(color: Colors.black,
                  fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 150),
            Container(
              width: 50,
              margin: EdgeInsets.only(right: 14),
              child: Text((DateFormat("HH:mm").format(DateTime.parse(data.date!))),
                  style: const TextStyle(color: Colors.black, fontSize: 18,
                  fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 17)),
            Icon(Icons.location_on,
                color: Colors.black54
            ),
            SizedBox(width: 10),
            Text(data.location!,
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 8),
        child: Divider(height: 10),
        ),
      ],
    );
  }
}
