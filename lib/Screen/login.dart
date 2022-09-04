import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_1/BottomNav/bottomnav.dart';
import 'package:project_1/Screen/home2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String noHp = "";
  String pass = "";

  TextEditingController NoHp = TextEditingController();
  TextEditingController Pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  iconLogin(),
                  textField(),
                  buildSubmit(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconLogin() {
    return Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 10),
          ),
          Image.asset(
              "assets/image/1.jpg",
            width: 100,
            height: 100,
          ),
          SizedBox(height: 10),
          Text(
              "Liga Indonesia Baru",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 50),
          ),
          Text(
            "Temukan pengalaman baru di Liga Indonesia",
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
  }

  Widget textField() {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 45),
        ),
        TextFormField(
          controller: NoHp,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone_android, color: Colors.black12),
            hintText: "Contoh: 082457264876",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          controller: Pass,
          obscureText: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline, color: Colors.black12),
            suffixIcon: Icon(Icons.visibility, color: Colors.black12,),
            hintText: "Password",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Lupa Password?",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget buildSubmit() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 30),
        ),
        MaterialButton(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            child: Text(
              "Masuk",
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
            onPressed: login,
        ),
        Padding(padding: EdgeInsets.only(top: 15),
        ),
        MaterialButton(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              child: Text(
                "Buat Akun Baru",
                style: TextStyle(fontSize: 22, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: (){}
        ),
      ],
    );
  }

  void login() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("noHp", NoHp.text);
      await prefs.setString("pass", Pass.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav()));
  }
}
