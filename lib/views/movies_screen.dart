import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pickLocationCell(),
          _carouselMoviesCell(),
          _nowShowingCell(),
        ],
      ),
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
              width: 24,
              height: 24,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "JAKARTA",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image.asset(
              "images/ic_triangle_drop_down.png",
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }

  _carouselMoviesCell() {
    return CarouselSlider(
      height: 150,
      viewportFraction: 1.0,
      scrollDirection: Axis.horizontal,
      autoPlay: true,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                )));
          },
        );
      }).toList(),
    );
  }

  _nowShowingCell() {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Now Showing",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                "More",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Image.asset(
                "images/ic_chevron_right_grey.png",
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
        _nowShowingCarousel()
      ],
    );
  }

  _nowShowingCarousel() {
    return CarouselSlider(
      height: 320,
      viewportFraction: 0.5,
      scrollDirection: Axis.horizontal,
      autoPlay: false,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("images/bg_my_loyal_tix_detail.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Judul Film $i",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        "Genre film $i",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    )),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
