import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/head.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('SIKOMPAK - PT. Lintas Sinergi Jabarindo'))
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
          height: 600.0,
          width: 1480.0,
          child: Carousel(
            images: [
              // NetworkImage(
              //     'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              // NetworkImage(
              //     'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
              ExactAssetImage("assets/images/koperasi0.jpg"),
              ExactAssetImage("assets/images/koperasi1.jpg"),
              ExactAssetImage("assets/images/koperasi2.png"),
              ExactAssetImage("assets/images/koperasi3.jpg"),
              ExactAssetImage("assets/images/koperasi4.jpg")
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.lightGreenAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.black.withOpacity(0.5),
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
          )),
    );
  }
}
