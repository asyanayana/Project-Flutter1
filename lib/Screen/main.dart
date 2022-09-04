import 'package:flutter/material.dart';
import 'package:project_1/BottomNav/bottomnav.dart';
import 'package:project_1/Screen/detailjadwal.dart';
import 'package:project_1/Screen/bottomjadwal.dart';
import 'package:project_1/Screen/flight.dart';
import 'package:project_1/Screen/home2.dart';
import 'package:project_1/Screen/lihatsemua_berita.dart';
import 'package:project_1/Screen/lihatsemua_klasemen.dart';
import 'package:project_1/Screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      home: const HomePage2(),
      // home: const FlightPage()
      // home: const BottomNav(),
      // home: const LihatKlasemen(),
      // home: const LihatBerita(),
      // home: const DetailJadwal(),
    );
  }
}
