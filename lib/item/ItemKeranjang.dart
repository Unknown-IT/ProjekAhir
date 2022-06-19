// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_f6_car_shop/controller/count_ctrl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';
import 'package:kelompok_f6_car_shop/page/HomePage2.dart';
import 'package:kelompok_f6_car_shop/page/detail_page.dart';

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          actions: [
            Column(
              children: [
                Text(
                  pesan,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 71, 71, 71),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Selesai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      });
}

class ItemCardKeranjang extends StatelessWidget {
  var _cCounter = Get.put(CounterController());
  var _dCounter = Get.put(CounterController2());
  

  final String image;
  final String barang;
  final int harga;
  final int jumlah;
  final String deskripsi;
  final String jenis;
  
  //// Pointer to Update Function
  final Function? onUpdate;
  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCardKeranjang(this.image, this.barang, this.harga, this.jumlah,
      this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});
      
        
      
  
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
    CollectionReference transaksi = firestore.collection("Transaksi");
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 120,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.network(image),
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              barang,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text(
            "RP. $harga",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(
          width: 30,
          height: 80,
        ),
        Column(children: [
          Row(children: [
            SizedBox(
              height: 40,
              width: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.white,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  )),
                  onPressed: () {
                    if (onUpdate2 != null) onUpdate2!();
                  }),
            ),
            new Container(
              padding: EdgeInsets.all(10),
              height: 35,
              width: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 199, 191, 191),
              ),
              child: Text(
                '$jumlah',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
              width: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.white,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
                  onPressed: () {
                    if (onUpdate != null) onUpdate!();
                  }),
            ),
          ]),
          SizedBox(
            width: 30,
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    )),
                    onPressed: (){
                      Navigator.push(
                        context, MaterialPageRoute(builder: (_) {
                          return DetailpageState(image, barang, harga, jumlah, deskripsi, jenis);
                        })
                      );
                    },
                    // onPressed: () {
                    //   final mySnackBar = SnackBar(
                    //     content: Text(
                    //       "Berhasil Dipesan",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //     duration: Duration(seconds: 3),
                    //     padding: EdgeInsets.all(10),
                    //     backgroundColor: Colors.green,
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                    //   transaksi.add({
                    //     'Image': image,
                    //     'Barang': barang,
                    //     'Jumlah': jumlah,
                    //     'Harga': harga * jumlah,
                    //     'Deskripsi': deskripsi,
                    //     'Jenis': jenis,
                    //     'User': user,
                    //   });
                    //   if (onDelete != null) onDelete!();
                    // }
                    ),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.cancel,
                      color: Colors.black,
                    )),
                    onPressed: () {
                      final mySnackBar = SnackBar(
                        content: Text(
                          "Berhasil Dihapuskan dari Keranjang",
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
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
        ]),
      ],
    );
  }
}
