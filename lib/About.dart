import 'package:flutter/material.dart';

class InfoToko extends StatelessWidget {
  static String routeName = "/info_toko";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 260,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Informasi Hot Rod Alley',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  subtitle: Text(
                    '\nHot Rod Alley merupakan toko miniatur mobil yang menjual berbagai macam miniatur mobil',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Text('Sentosa')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_call),
                    Text('99999993432')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.mail_outline),
                    Text('jimi@gmail.com')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
