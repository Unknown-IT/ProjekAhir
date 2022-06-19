import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_f6_car_shop/main.dart';
import 'package:kelompok_f6_car_shop/page/transaksi.dart';
import 'package:kelompok_f6_car_shop/theme.dart';

class DetailpageState extends StatelessWidget {
  final String image;
  final String barang;
  final int harga;
  final int jumlah;
  final String deskripsi;
  final String jenis;

  final Function? onUpdate;
  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  DetailpageState(this.image, this.barang, this.harga, this.jumlah,
      this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  int _PilihanWarnaIndex = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("Mobil");
    String? user = auth.currentUser!.email;
    CollectionReference transaksi = firestore.collection("Transaksi");
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 30),
      child: ListView(children: [
        SafeArea(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 268,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: bulao2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (_) {
                          return MyHomePage();
                        }));
                      },
                      child: Image.asset('assets/Back_Button.png')),
                  Image.asset('assets/Save_Button.png'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 93),
              width: 550,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )),
        SizedBox(
          height: 30,
        ),
        Text(
          'Deskripsi \n' + deskripsi,
          style: blackTektFont1.copyWith(
              fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 13),
          height: 50,
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
              color: bulao, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Harga',
                style: blackTektFont1.copyWith(fontSize: 18, color: greyColor),
              ),
              Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'Rp.' '$harga',
                    style: blackTektFont1.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text('Fitur Utama',
            style: blackTektFont1.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600)),
        Container(
          margin: EdgeInsets.only(top: 10, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: bulao2,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Image.asset('assets/Lock.png'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Security',
                        style: blackTektFont1.copyWith(fontSize: 12),
                      ),
                      Text(
                        'Smart Lock',
                        style: blackTektFont1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: bulao2,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Image.asset('assets/speedometer.png'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Speed',
                        style: blackTektFont1.copyWith(fontSize: 12),
                      ),
                      Text(
                        '',
                        style: blackTektFont1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: bulao2,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Image.asset('assets/engine.png'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Engine',
                        style: blackTektFont1.copyWith(fontSize: 12),
                      ),
                      Text(
                        '2,5L 4-Silinder',
                        style: blackTektFont1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: bulao2,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Image.asset('assets/kursi.png'),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seats',
                        style: blackTektFont1.copyWith(fontSize: 12),
                      ),
                      Text(
                        '',
                        style: blackTektFont1.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 30, bottom: 10),
        //   child: Text('Warna',
        //       style: blackTektFont1.copyWith(
        //           fontSize: 16, fontWeight: FontWeight.w600)),
        // ),
        // SizedBox(
        //   height: 5,
        // ),
        // Padding(
        //     padding: const EdgeInsets.only(top: 30, bottom: 10),
        //     child: SingleChildScrollView(
        //       scrollDirection: Axis.horizontal,
        //       child: Row(
        //         children: List.generate(_PilihanWarnaIndex, (index) {
        //           return GestureDetector(
        //             onTap: () {
        //               setState() {
        //                 _PilihanWarnaIndex = index;
        //               };
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.only(left: 10),
        //               child: Container(
        //                 width: 50,
        //                 height: 50,
        //                 decoration: BoxDecoration(
        //                     color: _PilihanWarnaIndex == index
        //                         ? Colors.black
        //                         : Colors.grey,
        //                     borderRadius: BorderRadius.circular(10),
        //                     boxShadow: [
        //                       BoxShadow(
        //                           spreadRadius: 0.5,
        //                           blurRadius: 1,
        //                           color: Colors.black.withOpacity(0.1))
        //                     ]),
        //               ),
        //             ),
        //           );
        //         }),
        //       ),
        //     )),
        Container(
            margin: EdgeInsets.only(top: 47, right: 30),
            height: 55,
            width: MediaQuery.of(context).size.width - 60,
            decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: ElevatedButton(
              child: Center(
                  child: Text(
                "Pesan Sekarang",
                style:
                    blackTektFont1.copyWith(fontSize: 16, color: Colors.white),
              )),
              onPressed: () {
                final mySnackBar = SnackBar(
                  content: Text(
                    "Berhasil Dipesan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  duration: Duration(seconds: 3),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                transaksi.add({
                  'Image': image,
                  'Barang': barang,
                  'Jumlah': jumlah,
                  'Harga': harga * jumlah,
                  'Deskripsi': deskripsi,
                  'Jenis': jenis,
                  'User': user,
                });
                if (onDelete != null) onDelete!();
              },
            ))
      ]),
    ));
  }
}
