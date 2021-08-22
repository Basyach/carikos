

import 'package:coazykos/models/space.dart';
import 'package:coazykos/pages/error_page.dart';
import 'package:coazykos/theme.dart';
import 'package:coazykos/widgets/facilities_item.dart';
import 'package:coazykos/widgets/ratting_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPage extends StatefulWidget {
  final Space space;
  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isclicked =false;
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async{
      if(await canLaunch(url)){
        launch(url);
      }else{
        //throw(url);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorPage()));
       }
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            
            ListView(
              children: [
                SizedBox(
                  height: 320,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: whitecolor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(TextSpan(
                                    text: '\$${widget.space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: '/month ',
                                          style: grayTextStyle.copyWith(
                                              fontSize: 16))
                                    ])),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((index){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2
                                  ),

                                  child: RatingItem(index:index,ratting: widget.space.rating,),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTED MAINFACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: widget.space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: widget.space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'cupboard',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: widget.space.numberOfCupboards,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTED:PHOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                           widget.space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    
                                    item,
                                    width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                    
                                  ),
                                ),
                              );
                            }).toList(),
                           
                           
                          
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTED:LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: grayTextStyle,
                            ),
                            InkWell(
                              onTap: (){
                                launchUrl(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width:MediaQuery.of(context).size.width-(2 * edge) ,
                         child: ElevatedButton(
                      onPressed: () {
                       launchUrl('tel:${widget.space.phone}');
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(purplecolor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      child: Text(
                        'Book Now',
                        style: whiteTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                      )
                    ],

                  ),
                ),
              ],
            ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      )),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isclicked =!isclicked;
                                            });
                    },
                    child: Image.asset(
                      isclicked ?'assets/btn_wishlist_filled.png' :
                      'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}
