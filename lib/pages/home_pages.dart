import 'package:coazykos/models/city.dart';
import 'package:coazykos/models/space.dart';
import 'package:coazykos/models/tips.dart';
import 'package:coazykos/providers/space_provider.dart';
import 'package:coazykos/theme.dart';
import 'package:coazykos/widgets/bottom_navbar_item.dart';
import 'package:coazykos/widgets/city_card.dart';
import 'package:coazykos/widgets/space_card.dart';
import 'package:coazykos/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
   
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge, horizontal: edge),
          child: ListView(
            children: [
              // NOTE:TITLE/HEADER
              Text(
                'Explore Know',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: grayTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              //POPULAR CITIES
              Text(
                'Popular Cities',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                        id: 1, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 2,
                        name: 'Surabaya',
                        imageUrl: 'assets/city2.png',
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 1, name: 'Bandung', imageUrl: 'assets/city3.png')),
                  ],
                ),
              ),
              // NOTE:RECOMENDED SPACE
              SizedBox(
                height: 30,
              ),
              Text(
                'Recomended Space',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(future: spaceProvider.getRecomendedSpaces(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<Space> data = snapshot.data;
                  int index =0;

                  return Column(
                children: data.map((item) {
                  index++;
                  return Container(
                    margin: EdgeInsets.only(
                      top: index== 1 ? 0 : 30,
                    ),
                    child: SpaceCard(item),
                  );
                }).toList(),
                  
                
              );
                }
                return Center(child: CircularProgressIndicator(),);
              }
              ),
              
              SizedBox(
                height: 30,
              ),
              Text(
                'Tips & Guidance',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        title: 'City GuideLines',
                        updateAt: 'Updated 20 Apr',
                        imageUrl: 'assets/icon_tips1.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TipsCard(
                    Tips(
                        id: 2,
                        title: 'Jakarta Fairship',
                        updateAt: 'Updated 11 Dec',
                        imageUrl: 'assets/icon_tips2.png'),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
                height: 65,
                width: MediaQuery.of(context).size.width - (2 * edge),
                margin: EdgeInsets.symmetric(horizontal: edge),
                decoration: BoxDecoration(
                    color: Color(0xffF6F7F8),
                    borderRadius: BorderRadius.circular(23)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavbarItem(
                      imageUrl: 'assets/icon_home.png',
                      isActive: true,
                    ),
                    BottomNavbarItem(
                      imageUrl: 'assets/icon_email.png',
                      isActive: false,
                    ),
                     BottomNavbarItem(
                      imageUrl: 'assets/icon_card.png',
                      isActive: false,
                    ),
                     BottomNavbarItem(
                      imageUrl: 'assets/icon_love.png',
                      isActive: false,
                    )

                    ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
