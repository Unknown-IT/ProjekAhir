// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:kelompok_f6_car_shop/page/HomePage.dart';
import 'package:kelompok_f6_car_shop/item/Item_Card.dart';
import 'package:kelompok_f6_car_shop/page/keranjang.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  static final List<Widget> tabBar = [
    Tab(text: "Semua"),
    Tab(text: "Sport"),
    Tab(text: "Tesla"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onTap: () {},
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Color.fromARGB(255, 92, 92, 92)),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: new BorderSide(color: Colors.white),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
          backgroundColor: Color.fromARGB(255, 61, 61, 61),
          bottom: TabBar(tabs: tabBar),
        ),
        body: TabBarView(
          children: [
            LauncherPage(),
            LauncherPage2(),
            LauncherPage3(),
          ],
        ),
      ),
    );
  }
}
