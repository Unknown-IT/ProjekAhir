

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
import 'package:kelompok_f6_car_shop/page/detail_page.dart';


class ItemImage extends StatelessWidget {
  var _cCounter = Get.put(CounterController());
  var _dCounter = Get.put(CounterController2());

  final String image;
  

  //// Pointer to Update Function
  final Function? onUpdate;
  final Function? onUpdate2;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemImage(this.image,
      {this.onUpdate, this.onUpdate2, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
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
      ],
    );
  }
}