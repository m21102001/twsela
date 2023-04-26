

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twsela/components/constants.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/components/default_app_bar.dart';
import '../../components/user_info_item.dart';
import 'new_trip.dart';

class DriverTripsScreen extends StatelessWidget {
  const DriverTripsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'My Trips',

        leadingFunction: (){},
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: ListView.separated(
          itemBuilder: (context, index)=>MyTripsCart(index: index),
          separatorBuilder: (context, index)=>SizedBox(height: 20.h,),
          itemCount: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateTo(context, NewTripScreen());
        },
        backgroundColor: secondaryColor,
        child: Icon(Icons.add,  size: 32.r,),
      )
    );
  }

}



class MyTripsCart extends StatelessWidget {
  MyTripsCart({Key? key, required this.index}) : super(key: key);
  int index;

  Color getColor(){
    if(index%2==0) return Color(0xff14A38B);
    else return Color(0xffFF9494);
  }

  String getTitle(){
    if(index%2==0) return 'Done';
    else return 'Canceled';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: getColor(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getTitle(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 9.sp,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 4,),
                      Icon(Icons.timelapse, color: Colors.white, size: 12.sp,),
                    ],
                  ),
                ),
                Text(
                  '2/4',
                  style: GoogleFonts.roboto(
                    color: secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserInfoItem(title: 'Driver', body: 'Mohamed Fayoumy'),
                        SizedBox(height: 10.h,),
                        UserInfoItem(title: 'Time', body: '10:25 pm'),
                        SizedBox(height: 10.h,),
                        UserInfoItem(title: 'Date', body: '15/5/2023'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        UserInfoItem(title: 'Trip Code', body: '1278369'),
                        SizedBox(height: 10.h,),
                        RatingBar.builder(
                          initialRating: 3,
                          itemSize: 20.sp,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) =>const Icon(Icons.star, color: Colors.amber, size: 10,),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          '22\$',
                          style: TextStyle(
                            color:Colors.lightBlue,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on_sharp, color: Colors.brown,),
                          Text(
                            'TO',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: Colors.black
                            ),
                          ),
                          Icon(Icons.location_on_sharp, color: Colors.green,),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Divider(color: Colors.grey,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Banha',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.black
                            ),
                          ),

                          Text(
                            'Elshorouk',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




