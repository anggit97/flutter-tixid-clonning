import 'package:flutter/material.dart';

class CinemasScreen extends StatefulWidget {
  @override
  _CinemasScreenState createState() => _CinemasScreenState();
}

class _CinemasScreenState extends State<CinemasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _pickLocationCell(),
        ],
      )
    );
  }

  _pickLocationCell() {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(250, 250, 251, 1)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/icon_location_pulltheater.png",
              fit: BoxFit.contain,
              width: 16,
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "JAKARTA",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Image.asset(
              "images/ic_triangle_drop_down.png",
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
