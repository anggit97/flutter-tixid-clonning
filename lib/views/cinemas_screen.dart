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
        _cinemasListCell(),
      ],
    ));
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

  _cinemasListCell() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
          _cinemasListItem(),
          Divider(),
        ],
      ),
    );
  }

  _cinemasListItem() {
    return ListTile(
      leading: Text(
        "AEON Mall BSD CITY XXI",
        maxLines: 1,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      trailing: Image.asset("images/ic_arrow.png", width: 14, height: 14,),
    );
  }
}
