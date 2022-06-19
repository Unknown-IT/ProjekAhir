import 'package:flutter/material.dart';
import 'package:kelompok_f6_car_shop/item/Item_Card.dart';
import 'package:kelompok_f6_car_shop/item/ItemKeranjang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 0, 255, 255),
      body: Stack(
        children: [
        Column(
          crossAxisAlignment: 
          CrossAxisAlignment.start, 
          children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: keranjang.where('User', isEqualTo: userEmail).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCardKeranjang(
                              e['Image'],
                              e['Barang'],
                              e['Harga'],
                              e['Jumlah'],
                              e['Deskripsi'],
                              e['Jenis'],
                              onUpdate: () {
                                keranjang.doc(e.id).update(
                                  {
                                    'Jumlah': e.get('Jumlah') + 1,
                                  },
                                );
                              },
                              onUpdate2: () {
                                if (e.get('Jumlah') <= 1) {
                                } else {
                                  keranjang.doc(e.id).update(
                                    {
                                      'Jumlah': e.get('Jumlah') - 1,
                                    },
                                  );
                                }
                              },
                              onDelete: () {
                                keranjang.doc(e.id).delete();
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
