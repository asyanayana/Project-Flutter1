import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screen/lihatsemua_jadwal.dart';
import 'package:project_1/model/jadwal_response.dart';
import 'detailjadwal.dart';
import '../model/jadwal_request.dart';
import 'package:intl/intl.dart';

class BottomJadwal extends StatefulWidget {
  const BottomJadwal({Key? key}) : super(key: key);

  @override
  State<BottomJadwal> createState() => _BottomJadwalState();
}

class _BottomJadwalState extends State<BottomJadwal> {

  List<JadwalResponseData> jadwallist = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {

    DataJadwal data = DataJadwal(startDate: "");
    IdentityJadwal identity = IdentityJadwal(reqDateTime: DateTime.now(), token: "");

    JadwalRequest request = JadwalRequest(data: data, identity: identity, service: "");

    try {
      var response = await Dio().post("https://sapp-api.asyst.co.id/ticket-ext/v1/lib/retrievematch",
        data: jadwalRequestToJson(request),
        options: Options(headers: {HttpHeaders.authorizationHeader: "Bearer e03d553d-61e4-3859-8279-2dfea7d1c7fe"}),
      );
      print("REPONSE HEADER : ${response.statusCode}");
      JadwalResponse resp = JadwalResponse.fromJson(response.data);

      setState(() {
        jadwallist = resp.data!;
        isLoading = false;
        Future.delayed(const Duration(seconds: 5));
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        JadwalPertandingan(jadwallist),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 120,
          child: isLoading? const Center(child: CircularProgressIndicator()) : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: jadwallist.length,
              itemBuilder:  (context, index) {
              JadwalResponseData data = jadwallist[index];
              return jadwalMatch(data);
            }
          ),
        ),
      ],
    );
  }

  Widget JadwalPertandingan(List<JadwalResponseData> listjadwal) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(right: 14)),
          const Text("Jadwal Pertandingan",
            style: TextStyle(fontSize: 22, color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 69),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LihatJadwal(jadwal: listjadwal, isLoading: isLoading)));
            },
            child: const Text("Lihat Semua",
              style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Widget jadwalMatch(JadwalResponseData data) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailJadwal(jadwalMatch: data,)));
      },
      child: Container(
        width: 150,
        // height: 120,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.memory(const Base64Decoder().convert(data.homeIcon!),
                  width: 55,
                  height: 55,
                ),
                const SizedBox(width: 25),
                Image.memory(const Base64Decoder().convert(data.awayIcon!),
                  width: 55,
                  height: 55,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(DateFormat("dd MMMM yyyy").format(DateTime.parse(data.date!)),
              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
              textAlign: TextAlign.center
            ),
            const SizedBox(height: 5),
            Text("${(DateFormat("HH:mm").format(DateTime.parse(data.date!)))} WIB",
              style: const TextStyle(color: Colors.black, fontSize: 11),
              textAlign: TextAlign.center
            ),
          ],
        ),
      ),
    );
  }
}
