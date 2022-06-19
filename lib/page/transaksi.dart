// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';
import 'package:kelompok_f6_car_shop/item/ItemTransaksi.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({Key? key}) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference transaksi = firestore.collection("Transaksi");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaksi',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 165, 165),
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: transaksi.where('User', isEqualTo: userEmail).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCardTransaksi(
                              e['Image'],
                              e['User'],
                              e['Barang'],
                              e['Harga'],
                              e['Jumlah'],
                              e['Deskripsi'],
                              e['Jenis'],
                              onDelete: () {
                                transaksi.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList());
                } else {
                  return Text("Barang Tidak Ada");
                }
              },
            ),
          ),
        ]),
      ]),
    );
  }
}
