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
    );
  }
}
