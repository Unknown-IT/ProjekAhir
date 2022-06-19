// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/About.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kelompok_f6_car_shop/login/Sign_In_Page.dart';
import 'package:kelompok_f6_car_shop/main.dart';
import 'package:kelompok_f6_car_shop/page/HomePage2.dart';
import 'package:kelompok_f6_car_shop/page/beranda.dart';
import 'package:kelompok_f6_car_shop/page/favorite.dart';
import 'package:kelompok_f6_car_shop/page/keranjang.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil")
        ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          "Email : " + auth.currentUser!.email.toString(),
          style: TextStyle(
            fontSize: 26,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 165, 45, 139),
              ),
              child: Text("Halaman Akun"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("About"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoToko()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HalamanPage()));
              },
              
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Keranjang"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KeranjangPage()));
              },
              
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("Favorite"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              
            ),
          ],
        ),
      ),
    );
  }
}
