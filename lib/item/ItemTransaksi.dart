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

class ItemCardTransaksi extends StatelessWidget {
  final String image;
  final String user;
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

  ItemCardTransaksi(this.image, this.user, this.barang, this.harga, this.jumlah,
      this.deskripsi, this.jenis,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String user = auth.currentUser!.email.toString();
    CollectionReference transaksi = firestore.collection("Transaksi");
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.5),
          height: 120,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Image.network(image),
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "User : " + user,
              style:
              TextStyle(color: Colors.black
              ),
            ),
          ),
          Text(
            "Barang : " + barang,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "" + deskripsi,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Jenis : " + jenis,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "RP. $harga",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Jumlah : $jumlah",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ],
    );
  }
}
