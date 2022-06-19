// ignore_for_file: prefer_const_constructors




import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kelompok_f6_car_shop/item/Item_Card.dart';
import 'package:kelompok_f6_car_shop/item/ItemFavorite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kelompok_f6_car_shop/auth_services.dart';
import 'package:kelompok_f6_car_shop/theme.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Favorite = firestore.collection("Favorite");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueAccent,
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: Favorite.where('User', isEqualTo: userEmail).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCardFavorite(
                              e['Image'],
                              e['Barang'],
                              e['Harga'],
                              e['Deskripsi'],
                              e['Jenis'],
                              onDelete: () {
                                Favorite.doc(e.id).delete();
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
            primary: Color(0xFF023E4A),
            onPrimary: Colors.white,
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
            backgroundColor: Colors.blue,
          );
          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        },
      ),
    );
  }
}
