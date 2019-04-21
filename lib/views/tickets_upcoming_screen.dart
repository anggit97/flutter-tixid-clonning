import 'package:flutter/material.dart';

class TicketUpcomingScreen extends StatefulWidget {
  @override
  _TicketUpcomingScreenState createState() => _TicketUpcomingScreenState();
}

class _TicketUpcomingScreenState extends State<TicketUpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/img_empty_mytiket.png", fit: BoxFit.contain, width: 100, height: 100,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Tidak ada ticket yang akan datang",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
