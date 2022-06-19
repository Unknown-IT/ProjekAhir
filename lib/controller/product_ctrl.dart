// ignore_for_file: prefer_const_constructors


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _counter = 1.obs;

class CounterController extends StatefulWidget {
  @override
  _CounterController createState() => _CounterController();
}

class _CounterController extends State<CounterController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.remove,
              color: Colors.pink,
            ),
          ),
          Container(
            height: double.infinity,
            width: 30,
            color: Colors.pink,
            child: Center(
                child: Text(
              '1',
              style: TextStyle(color: Colors.amber),
            )),
          ),
          Container(
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
