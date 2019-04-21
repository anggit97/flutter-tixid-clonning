import 'package:flutter/material.dart';

import 'tickets_upcoming_screen.dart';
import 'tickets_past_screen.dart';

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: TabBar(
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: "Upcoming Ticket",
                    ),
                    Tab(
                      text: "Past Ticket",
                    )
                  ],
                  labelColor: Colors.black,
                )),
            body: TabBarView(
                children: [TicketUpcomingScreen(), TicketPastScreen()]),
          )),
    );
  }
}
