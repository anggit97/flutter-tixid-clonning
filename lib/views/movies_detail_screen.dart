import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 360,
              flexibleSpace: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("images/bg_my_loyal_tix_detail.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Image.asset(
                        "images/ic_play_dark.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 80,
                        margin: EdgeInsets.only(left: 20, top: 160),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "images/bg_my_loyal_tix_detail.png"))),
                        child: Center(
                          child: Image.asset(
                            "images/ic_play_dark.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 230, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Avengers : End Game",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "Genre",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text(
                                        "Action, Advanture, Fantasy",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "Durasi",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text(
                                        "3 Jam 1 Menit",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "Sutradara",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Text(
                                        "Anthony Russo, Joe Russo",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ]),
                                    TableRow(children: [
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      Chip(
                                        label: Text(
                                          "R",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      )
                                    ])
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
