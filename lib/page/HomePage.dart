// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';
import 'package:kelompok_f6_car_shop/controller/count_ctrl.dart';
import 'package:kelompok_f6_car_shop/item/Item_Card.dart';
import 'package:kelompok_f6_car_shop/theme.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("Mobil");
    return Scaffold(
      backgroundColor: Colors.white,
      
      body:SafeArea(
        bottom: false, 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HER
            child: StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(
                            e['Image'], 
                            e['Barang'],
                            e['Harga'], 
                            e['Deskripsi'], 
                            e['Jenis']))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]
        ) 
      ),
      
      
      
    ); 
    
  }
}

class LauncherPage2 extends StatefulWidget {
  const LauncherPage2({Key? key}) : super(key: key);

  @override
  State<LauncherPage2> createState() => _LauncherPageState2();
}

class _LauncherPageState2 extends State<LauncherPage2> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("Sport");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false, 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HER
            child: StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(
                            e['Image'], 
                            e['Barang'],
                            e['Harga'], 
                            e['Deskripsi'], 
                            e['Jenis']))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]
        ) 
      ),

      
    ); 
    
  }
}

class LauncherPage3 extends StatefulWidget {
  const LauncherPage3({Key? key}) : super(key: key);

  @override
  State<LauncherPage3> createState() => _LauncherPageState3();
}

class _LauncherPageState3 extends State<LauncherPage3> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("Tesla");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false, 
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //// VIEW DATA HER
            child: StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map((e) => ItemCard(
                            e['Image'], 
                            e['Barang'],
                            e['Harga'], 
                            e['Deskripsi'], 
                            e['Jenis']))
                          .toList());
                } else {
                  return Text("Barang Habis");
                }
              },
            ),
          ),
        ]
        ) 
      ),

      
    ); 
    
  }
}



class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 55,
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text("Pesan"),
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 2, 20, 179),
            onPrimary: Color.fromARGB(169, 255, 255, 255),
            padding: EdgeInsets.all(10.0),
            minimumSize: Size(200, 180)),
        onPressed: () {
          final mySnackBar = SnackBar(
            content: Text(
              "Berhasil Dimasukan di Keranjang",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            duration: Duration(seconds: 3),
            padding: EdgeInsets.all(10),
            backgroundColor: Color.fromARGB(255, 161, 197, 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        },
      ),
    );
  }
}
