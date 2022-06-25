// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kelompok_f6_car_shop/MyContainer.dart';
import 'package:kelompok_f6_car_shop/main.dart';
import 'package:kelompok_f6_car_shop/page/HomePage2.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            height: 400,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Color.fromARGB(200, 54, 60, 79),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Container(
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Hot Rod Alley',
              style: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 23,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              ' Selamat Datang \n Hot Rod Alley Adalah sebuah aplikasi toko mobil \n Hot Rod Alley Menjual hanya menjual 2 jenis mobil yaitu: \n Sport dan Tesla ',
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () { Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                                builder: (context) => HalamanPage()));
                                },
                // => Get.to(HalamanPage()),
                child: Text(
                  'Mulai',
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w600
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 54, 60, 79),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
