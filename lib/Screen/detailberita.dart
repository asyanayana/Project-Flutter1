import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screen/bottomberita.dart';
import 'package:project_1/model/berita_response.dart';
import 'package:html/parser.dart';

class DetailBerita extends StatefulWidget {
  final NewsResult berita;

  const DetailBerita({Key? key, required this.berita}) : super(key: key);

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => BottomBerita()));
            },
            icon: Icon(CupertinoIcons.back, color: Colors.white, size: 30)),
        title: Text("${widget.berita.tITLE!}"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20,
        fontWeight: FontWeight.w500),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Image.network(widget.berita.iMAGE!),
              ),
            SizedBox(height: 13),
           Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(widget.berita.tITLE!,
                 style: TextStyle(color: Colors.black, fontSize: 20,
                 fontWeight: FontWeight.bold),
                  ),
            ),
            SizedBox(height: 13),
            Container(
              margin: EdgeInsets.only(right: 222),
              child: Text(widget.berita.pUBLISHDATE!,
                style: TextStyle(color: Colors.blueGrey, fontSize: 13),
              ),
            ),
            SizedBox(height: 13),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(parseHtmlString(widget.berita.dESC!)!,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String? parsedString = parse(document.body?.text).
  documentElement?.text;

  return parsedString;
}
