// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kelompok_f6_car_shop/page/beranda.dart';
import 'package:kelompok_f6_car_shop/page/favorite.dart';
import 'package:kelompok_f6_car_shop/page/keranjang.dart';
import 'package:kelompok_f6_car_shop/page/transaksi.dart';
import 'package:kelompok_f6_car_shop/page/halamanakun.dart';

class HalamanPage extends StatefulWidget {
  @override
  State<HalamanPage> createState() => _HalamanPageState();
}

class _HalamanPageState extends State<HalamanPage> {
  int _bottomNavCurrenntIndex = 0;
  List<Widget> _container = [
    Beranda(),
    FavoritePage(),
    KeranjangPage(),
    TransaksiPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrenntIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 0, 11, 168),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrenntIndex = index;
          });
        },
        currentIndex: _bottomNavCurrenntIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz_sharp),
            label: "Transaki",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
