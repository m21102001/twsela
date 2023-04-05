
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twsela/components/default_app_bar.dart';
import '../../components/user_info_item.dart';

class PromotionsScreen extends StatelessWidget {
  const PromotionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Promotions',
        leadingFunction: (){},
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView.separated(
          itemBuilder: (context, index)=>PromotionsCart(index: index),
          separatorBuilder: (context, index)=>SizedBox(height: 20.h,),
          itemCount: 10,
        ),
      ),
    );
  }


}


class PromotionsCart extends StatelessWidget {
  PromotionsCart({Key? key, required this.index}) : super(key: key);
  int index;

  Color getColor(){
    if(index==0||index==5||index==9) return Color(0xfffcda97);
    else if(index==2||index==4) return Color(0xff84d4e1);
    else if(index==3||index==7) return Color(0xfff8d691);
    else return Color(0xffFF9494);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      //elevation: 2.0,
      color: getColor(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserInfoItem(title: 'Code', body: 'TPO1235'),
                    UserInfoItem(title: 'Discount', body: '150%'),
                  ],
                ),
                SizedBox(height: 10.h,),
                UserInfoItem(title: 'Condition', body: 'When trip cost less than 35 L.E'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
