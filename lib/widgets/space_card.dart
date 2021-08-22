import 'package:coazykos/models/space.dart';
import 'package:coazykos/pages/detail_page.dart';
import 'package:coazykos/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(space)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(space.imageUrl,width: 130,height: 110,fit: BoxFit.cover,),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                          color: purplecolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              '${space.rating}/5',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 2,
              ),
              Text.rich(TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: '/month ',
                        style: grayTextStyle.copyWith(fontSize: 16))
                  ])),
              SizedBox(
                height: 16,
              ),
              Text(
                '${space.city},${space.country}',
                style: grayTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
