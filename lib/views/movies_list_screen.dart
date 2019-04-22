import 'package:flutter/material.dart';

class MoviesListScreen extends StatefulWidget {
  @override
  _MoviesListScreenState createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Video"),
        backgroundColor: Color.fromRGBO(3, 27, 57, 1),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _moviesListItem(),
          _moviesListItem(),
          _moviesListItem(),
          _moviesListItem(),
          _moviesListItem(),
        ],
      ),
    );
  }

  _moviesListItem() {
    return Container(
      color: Color.fromRGBO(3, 27, 57, 1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"))),
            child: Center(
              child: Image.asset(
                "images/ic_play_dark.png",
                fit: BoxFit.contain,
                width: 48,
                height: 48,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Marvel Studios' Avengers: Endgame | \"Powerful\" TV Spot",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Image.asset(
                        "images/movie.png",
                        width: 12,
                        height: 12,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Marvel Studios' Avengers: Endgame | \"Powerful\" TV Spot",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Diterbikan: 22 Apr",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 1,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "3k Ditonton",
                            maxLines: 1,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          VerticalDivider(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "images/ic_content_like.png",
                              width: 12,
                              height: 12,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "52",
                              maxLines: 1,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                          Image.asset(
                            "images/ic_content_like.png",
                            width: 12,
                            height: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
