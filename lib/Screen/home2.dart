import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/Screen/bottomberita.dart';
import 'package:project_1/Screen/bottomklasmen.dart';
import 'package:project_1/Screen/flight.dart';
import 'package:project_1/Screen/image_slider.dart';
import 'package:project_1/Screen/lihatsemua_berita.dart';
import 'package:project_1/Screen/lihatsemua_klasemen.dart';
import 'package:project_1/Screen/login.dart';
import 'package:project_1/model/berita_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import '../model/klasmen_response.dart';
import 'bottomjadwal.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}


class _HomePage2State extends State<HomePage2> {

  String noHp = "";
  String pass = "";

  TextEditingController NoHp = TextEditingController();
  TextEditingController Pass = TextEditingController();

  void initState() {
    super.initState();
    getLogin();
  }

  void getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      noHp = prefs.getString("noHp")!;
      pass = prefs.getString("pass")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 15),
          child: Image.asset("assets/image/6.jpg"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 10),
            child:  IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_sharp,
                color: Colors.blue, size: 30)),
          ),
        ],
        title: Column(
          children: <Widget>[
            Image.asset("assets/image/2.png",
              width: 70,
              height: 35,
            ),
            Text("Liga Indonesia Baru",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            gridView(),
            ImageSlider(),
            bottomImageSlide(),
            SizedBox(height: 20),
            BottomJadwal(),
            SizedBox(height: 25),
            BottomBerita(),
            SizedBox(height: 20),
            BottomKlasmen(),
          ],
        ),
      ),
    );
  }

  Widget gridView() {
    return Container(
      height: 60,
      color: Colors.lightBlue,
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FlightPage()));
                },
                child: Icon(Icons.flight_takeoff, color: Colors.white, size: 27),
              ),
              SizedBox(height: 4),
              Text("Penerbangan",
                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              InkWell(
                onTap: () {},
                child: Icon(Icons.directions_bus, color: Colors.white, size: 27),
              ),
              SizedBox(height: 4),
              Text("Kereta Api",
                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              InkWell(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove("noHp");
                  prefs.remove("pass");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:
                  (context) => LoginPage()));
                },
                child: Icon(Icons.paypal, color: Colors.white, size: 27),
              ),
              SizedBox(height: 4),
              Text("Kirim Aja",
                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomImageSlide() {
    return Container(
      height: 85,
      color: CupertinoColors.white,
      child: GridView.count(
          crossAxisCount: 3,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.lightBlue.withOpacity(0.2),
                ),
                child: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.ticket_fill,
                color: Colors.blue)),
              ),
              SizedBox(height: 7),
              Text("Tiket Penerbangan",
              style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.green.withOpacity(0.2),                ),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded,
                    color: Colors.lightGreen)),
              ),
              SizedBox(height: 7),
              Text("LIB Store",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.orangeAccent.withOpacity(0.2),                ),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.sports_basketball_outlined,
                color: Colors.orangeAccent)),
              ),
              SizedBox(height: 7),
              Text("LIB Portal",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

}







