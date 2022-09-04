import 'package:flutter/material.dart';
import 'package:project_1/Screen/detailjadwal.dart';
import 'package:project_1/Screen/detailberita.dart';
import 'package:project_1/Screen/flight.dart';
import 'package:project_1/Screen/home2.dart';
import 'package:project_1/Screen/login.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int currentIndex = 0;

  void onTabBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final tampilan = [
    HomePage2(),
    LoginPage(),
    FlightPage(),
    FlightPage(),
    FlightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tampilan[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 10,
          selectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.blue,
          currentIndex: currentIndex,
          onTap: onTabBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplanemode_active),label: 'Penerbangan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus),label: 'Kereta Api'),
            BottomNavigationBarItem(
                icon: Icon(Icons.paypal),label: 'Kirim Aja'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),label: 'Akun Saya'),
          ]),
    );
  }
}
