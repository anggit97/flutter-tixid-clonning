import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tix_app/src/blocs/now_playing_bloc.dart';
import 'package:tix_app/src/models/now_playing_models.dart';
import 'package:tix_app/src/blocs/genres_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'movies_detail_screen.dart';
import 'movies_list_screen.dart';
import 'spotlight_detail_screen.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    bloc.fetchNowPlayingMovies();
    bloc.fetchPopularMovie();
    genreBloc.fetchAllGenres();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    genreBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _pickLocationCell(),
            _carouselMoviesCell(),
            _nowShowingCell(),
            _shareCodeAndGetPointCell(),
            _videosCell(),
            Divider(
              height: 3,
            ),
            _spotLightCell(),
            Divider(
              height: 3,
            ),
            _tixNowCell(),
            Divider(
              height: 3,
            ),
            _comingSoonCell(),
          ],
        ),
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
    return StreamBuilder(
        stream: bloc.nowPlaying,
        builder:
            (BuildContext context, AsyncSnapshot<NowPlayingMovies> snapshot) {
          if (snapshot.hasData) {
            return _nowShowingCarouselBuild(snapshot.data.results);
          } else if (snapshot.hasError) {
            Text(snapshot.error.toString());
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  _shareCodeAndGetPointCell() {
    return Container(
      color: Color.fromRGBO(243, 218, 143, 1),
      padding: EdgeInsets.only(left: 16, top: 7, right: 16, bottom: 7),
      child: Row(
        children: <Widget>[
          Center(
              child: Image.asset(
            "images/ic_invitation_code_homepage.png",
            width: 12,
            height: 12,
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "SHARE CODE & GET POINT!",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )),
          Image.asset(
            "images/ic_home_page_more_button.png",
            width: 12,
            height: 12,
          ),
        ],
      ),
    );
  }

  _videosCell() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MoviesListScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Videos",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: 250,
                child: StreamBuilder(
                    stream: bloc.moviePopular,
                    builder: (BuildContext context,
                        AsyncSnapshot<NowPlayingMovies> snapshot) {
                      if (snapshot.hasData) {
                        return _buildListVideo(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );
  }

  _videosItem(Result result) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0),
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 120,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/original/${result.backdropPath}"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Image.asset(
                "images/ic_play_dark.png",
                width: 32,
                height: 32,
              ),
            ),
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  result.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "2K plays | ${result.releaseDate}",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _spotLightCell() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SpotlightDetailScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                "Spotlight",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _spotlightItem(),
                  _spotlightItem(),
                  _spotlightItem(),
                  _spotlightItem(),
                  _spotlightItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _spotlightItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0, top: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "3 Film Indonesia Yang Sayang Dilewatkan!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                        maxLines: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Rumput Tetangga",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                )),
            Container(
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "ASLI INDONESIA",
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "15",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "April 2019",
                        maxLines: 1,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _comingSoonCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
              )),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
                _comingSoonItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _comingSoonItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 0),
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(top: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Avengers : End Game",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Fantasy, Trailer, Action, Comedy",
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _tixNowCell() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "TIX Now",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                _tixNowItem(),
                _tixNowItem(),
                _tixNowItem(),
                _tixNowItem(),
                _tixNowItem(),
                _tixNowItem(),
                _tixNowItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _tixNowItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/bg_my_loyal_tix_detail.png"))),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "PRE-SALE Marvel Studios Avengers: End Game",
                        maxLines: 2,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Chip(
                        elevation: 5,
                        label: Text(
                          "News",
                          style: TextStyle(fontSize: 10),
                          maxLines: 1,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Image.asset(
                            "images/ic_content_view.png",
                            width: 14,
                            height: 14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "833",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: <Widget>[
                          Image.asset(
                            "images/ic_content_like.png",
                            width: 14,
                            height: 14,
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "833",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Text(
                        "By Tix ID Team",
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
                      Expanded(
                          child: Text(
                        "Just Now",
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )),
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

  _nowShowingCarouselBuild(List<Result> results) {
    return CarouselSlider(
      height: 320,
      viewportFraction: 0.5,
      scrollDirection: Axis.horizontal,
      autoPlay: false,
      aspectRatio: 16 / 9,
      initialPage: 0,
      enableInfiniteScroll: true,
      items: results.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/${i.backdropPath}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailScreen()));
                  },
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    i.title,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          i.genresNames,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ))),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  _buildListVideo(NowPlayingMovies data) {
    return ListView.builder(
        itemCount: data.results.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int i) {
          return _videosItem(data.results[i]);
        });
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });

    bloc.fetchNowPlayingMovies();
    bloc.fetchPopularMovie();
    genreBloc.fetchAllGenres();

    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }
}
