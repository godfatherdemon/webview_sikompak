import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String description;
  // final Color bgColor;
  final String bgImage;

  Slide({
    @required this.imageUrl,
    @required this.description,
    // @required this.bgColor,
    @required this.bgImage,
  });
}

final slideList = [
  Slide(
    // imageUrl: 'assets/images/s_pertanian.png',
    imageUrl: 'assets/images/icon.png',
    description: 'Sektor Pertanian',
    bgImage: 'assets/images/main_background.jpg',
    // bgColor: Colors.redAccent,
  ),
  Slide(
    // imageUrl: 'assets/images/s_perkebunan.png',
    imageUrl: 'assets/images/icon.png',
    description: 'Sektor Perkebunan',
    bgImage: 'assets/images/olahan_perkebunan.jpg',
    // bgColor: Colors.blueAccent,
  ),
  Slide(
    // imageUrl: 'assets/images/s_peternakan.png',
    imageUrl: 'assets/images/icon.png',
    description: 'Sektor Peternakan',
    bgImage: 'assets/images/olahan_peternakan.jpg',
    // bgColor: Colors.black,
  ),
  Slide(
    // imageUrl: 'assets/images/s_perikanan.png',
    imageUrl: 'assets/images/icon.png',
    description: 'Sektor Perikanan',
    bgImage: 'assets/images/olahan_perikanan.webp',
    // bgColor: Colors.blueAccent,
  ),
  Slide(
    // imageUrl: 'assets/images/s_hutan.png',
    imageUrl: 'assets/images/icon.png',
    description: 'Sektor Kehutahan',
    bgImage: 'assets/images/olahan_kehutanan.jpg',
    // bgColor: Colors.deepOrange,
  ),
];
