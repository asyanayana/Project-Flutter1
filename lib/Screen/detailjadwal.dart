import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_1/model/jadwal_request.dart';
import 'package:project_1/model/jadwal_response.dart';

class DetailJadwal extends StatefulWidget {
  final JadwalResponseData jadwalMatch;

  const DetailJadwal({Key? key, required this.jadwalMatch}) : super(key: key);

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.jadwalMatch.home!} VS ${widget.jadwalMatch.away!}"),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black45
        ),
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/31.jpg"),
                    fit: BoxFit.cover
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 75,
                              child: Image.memory(Base64Decoder().convert(widget.jadwalMatch.homeIcon!),
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Text(widget.jadwalMatch.home!,
                                style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Text("VS",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 75,
                              child: Image.memory(Base64Decoder().convert(widget.jadwalMatch.awayIcon!),
                                width: 70,
                                height: 70,
                              ),
                            ),
                            Text(widget.jadwalMatch.away!,
                                style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 200,
                child: Container(
                  padding: EdgeInsets.fromLTRB(18, 40, 18, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Waktu Pertandingan",
                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.lightBlueAccent.withOpacity(0.15),
                                    ),
                                    child: Icon(Icons.calendar_month_outlined,
                                    color: Colors.blue
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(DateFormat("EEEE d MMMM yyyy").format(DateTime.parse(widget.jadwalMatch.date!)),
                                    style: TextStyle(color: Colors.blue, fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.lightBlueAccent.withOpacity(0.15),
                                    ),
                                    child: Icon(Icons.access_time,
                                        color: Colors.blue
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text("${(DateFormat("HH:mm").format(DateTime.parse(widget.jadwalMatch.date!)))} WIB",
                                    style: TextStyle(color: Colors.blue, fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Divider(height: 1),
                              SizedBox(height: 15),
                              Text("Lokasi Pertandingan",
                                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.lightBlueAccent.withOpacity(0.15),
                                    ),
                                    child: Icon(Icons.location_on_outlined,
                                        color: Colors.blue
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(widget.jadwalMatch.location!,
                                    style: TextStyle(color: Colors.blue, fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 680),
              width: MediaQuery.of(context).size.width,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Text("Beli Tiket Pertandingan",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
