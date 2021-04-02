import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:jokes_app/model/jokes_response.dart';
import 'package:jokes_app/services/api_manager.dart';
import 'package:jokes_app/utils/color_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: QuoteView(),
    );
  }
}

class QuoteView extends StatefulWidget {
  @override
  _QuoteViewState createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  Future _jokeFuture;

  @override
  void initState() {
    _jokeFuture = APIManager().getJoke();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color = colors[math.Random().nextInt(colors.length)];

    return Container(
      color: color,
      width: double.infinity,
      child: SafeArea(
        child: FutureBuilder<JokeResponse>(
            future: _jokeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return QuoteItem(snapshot.data);
              }
            }),
      ),
    );
  }

  Widget QuoteItem(JokeResponse joke) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "\nProgramming Jokes",
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/images/left-quote.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    joke.joke,
                    //overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                    style:
                        GoogleFonts.ptSerif(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.asset(
                      'assets/images/images/left-quote.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              _onValueChange();
            },
          ),
        )
      ],
    );
  }

  void _onValueChange() {
    _jokeFuture = APIManager().getJoke();
    setState(() {});
  }
}
