import 'package:flutter/material.dart';

class SpotlightDetailScreen extends StatefulWidget {
  @override
  _SpotlightDetailScreenState createState() => _SpotlightDetailScreenState();
}

class _SpotlightDetailScreenState extends State<SpotlightDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "News",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.share,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            "images/bg_my_loyal_tix_detail.png",
            height: 200,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
