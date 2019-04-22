import 'package:flutter/material.dart';

import 'ticket_detail_screen.dart';

class TicketPastScreen extends StatefulWidget {
  @override
  _TicketPastScreenState createState() => _TicketPastScreenState();
}

class _TicketPastScreenState extends State<TicketPastScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _ticketPastItem(),
          Divider(),
          _ticketPastItem(),
          Divider(),
          _ticketPastItem(),
          Divider(),
          _ticketPastItem(),
        ],
      ),
    );
  }

  _ticketPastItem() {
    return GestureDetector(
      onTap: () =>{
        Navigator.push(context, MaterialPageRoute(builder: (context) => TicketDetailScreen()))
      },
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
                        style: TextStyle(color: Colors.blue, fontSize: 14,),
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
