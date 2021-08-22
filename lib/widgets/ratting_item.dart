import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int ratting;
  RatingItem({this.index,this.ratting});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index<=ratting?'assets/icon_star.png':'assets/icon_star_grey.png',
      width: 20,
      
    );
  }
}