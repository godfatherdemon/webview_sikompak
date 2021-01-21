import 'package:flutter/material.dart';
import 'slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  // final double height;
  // final double width;

  SlideItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: slideList[index].bgColor,
        image: new DecorationImage(
          image: AssetImage(slideList[index].bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 100,
            backgroundImage: AssetImage(slideList[index].imageUrl),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              slideList[index].description,
              style: TextStyle(
                fontSize: 100.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
