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

class ItemCardProfil extends StatelessWidget {
  final String image;
  final String user;
  final String barang;
  final int harga;
  final int jumlah;
  final String deskripsi;
  final String jenis;

  ItemCardProfil(
    this.image,
    this.user,
    this.barang,
    this.harga,
    this.jumlah,
    this.deskripsi,
    this.jenis,
  );

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String user = auth.currentUser!.email.toString();
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "User : " + user,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
