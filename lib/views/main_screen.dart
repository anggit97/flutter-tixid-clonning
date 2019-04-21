import 'package:flutter/material.dart';

import 'movies_screen.dart';
import 'cinemas_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _cIndex = 0;

  List<Widget> _children = [
    MoviesScreen(),
    CinemasScreen(),
    CinemasScreen(),
  ];

  incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _bodyMain(),
    );
  }

  Widget _appBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          "2.5K Point",
          style: TextStyle(color: Colors.black, fontSize: 12),
        )),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("images/logo_dark_beta.png"),
      ),
      backgroundColor: Colors.white,
      elevation: 3,
      centerTitle: true,
      actions: <Widget>[
        Image.asset(
          "images/ico_noti_top_home.png",
          width: 32,
          height: 32,
          fit: BoxFit.contain,
        )
      ],
    );
  }

  Widget _bodyMain() {
    return Scaffold(
      body: Center(child: _children[_cIndex]),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(onTap: incrementTab, items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "images/icon_theater.png",
              height: 24,
              width: 24,
            ),
            title: Text(
              "Movies",
              style: TextStyle(
                  color: Color.fromRGBO(153, 164, 170, 1), fontSize: 12),
            )),
        BottomNavigationBarItem(
          icon: Image.asset(
            "images/icon_cinema_moviedetail.png",
            height: 24,
            width: 24,
          ),
          title: Text(
            "Cinemas",
            style: TextStyle(
                color: Color.fromRGBO(153, 164, 170, 1), fontSize: 12),
          ),
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              "images/icon_ticket_unselected.png",
              height: 24,
              width: 24,
            ),
            title: Text(
              "Tickets",
              style: TextStyle(
                  color: Color.fromRGBO(153, 164, 170, 1), fontSize: 12),
            )),
      ]),
    );
  }
}
