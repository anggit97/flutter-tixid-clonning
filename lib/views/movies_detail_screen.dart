import 'package:flutter/material.dart';

import 'tickets_past_screen.dart';
import 'tickets_upcoming_screen.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 375,
            pinned: true,
            snap: true,
            floating: true,
            title: Text("Avengers : End Game"),
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
                      height: 140,
                      width: 90,
                      margin: EdgeInsets.only(left: 20, top: 140),
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
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.top,
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Durasi",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "3 Jam 1 Menit",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Sutradara",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Anthony Russo, Joe Russo",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Chip(
                                        label: Text(
                                          "R",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      ),
                                    )
                                  ])
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
              _ticketPastItem(),
              _ticketPastItem(),
              _ticketPastItem(),
              _ticketPastItem(),
              _ticketPastItem(),
          ]))
        ],
      ),
    );
  }

  _ticketPastItem() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 120,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Captain America",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset(
                        "images/ic_location_gray_covered.png",
                        width: 12,
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "BALE KOTA XXI",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.asset(
                          "images/ic_ticket_gray_covered.png",
                          width: 12,
                          height: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Ticket(2)",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Sabtu, 16 Maret 2019, 20:00",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Status Tiket",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Berhasil",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
