// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 55, 192, 255),
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
                    color: Colors.blue,
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

class ItemCard extends StatelessWidget {
  final String image;
  final String barang;
  final int harga;
  final String deskripsi;
  final String jenis;

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.image, this.barang, this.harga, this.deskripsi, this.jenis,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
    CollectionReference Favorite = firestore.collection("Favorite");
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: 
          Image.network(image),

        ),
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
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                    keranjang.add({
                      'Image': image,
                      'Barang': barang,
                      'Jumlah': 1,
                      'Harga': harga,
                      'Deskripsi': deskripsi,
                      'Jenis': jenis,
                      'User': user,
                    });
                  }),
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
                    Icons.favorite,
                    color: Colors.black,
                  )),
                  onPressed: () {
                    final mySnackBar = SnackBar(
                      content: Text(
                        "Berhasil Dimasukan di Favorite",
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
                    Favorite.add({
                      'Image': image,
                      'Barang': barang,
                      'Harga': harga,
                      'Deskripsi': deskripsi,
                      'Jenis': jenis,
                      'User': user,
                    });
                  }),
            )
          ],
        )
      ],
    );
  }
}
