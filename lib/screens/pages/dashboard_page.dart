import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            imageCarousel(context),
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 4.0,
        images: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL1"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL1"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL1"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL1"),
          )
        ],
      ),
    );
  }
}
