import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twsela/components/constants.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/components/custom_button.dart';
import 'package:twsela/components/default_app_bar.dart';
import 'package:twsela/layout/home_layout.dart';
import 'package:twsela/models/models.dart';
import 'package:twsela/modules/driver_modules/driver_home_layout.dart';
import 'package:twsela/modules/login_screen/login_screen.dart';
import 'package:twsela/shared/network/local/cache_helper.dart';

import '../../register_screen/register_cubit.dart';
import '../../register_screen/register_states.dart';


class DriverSignUpScreen extends  StatelessWidget {

  var pageontroller = PageController();
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){},
        builder: (context, state)=> Scaffold(
          appBar: DefaultAppBar(
            leadingFunction: (){},
            title: RegisterCubit.get(context).appBarTitles[RegisterCubit.get(context).pageIndex],
          ),
          body: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (context,index) => RegisterCubit.get(context).driverScreens[index],
                    onPageChanged: (index){
                      RegisterCubit.get(context).changePageIndex(index);
                      if(index==RegisterCubit.get(context).driverScreens.length-1){
                        isLast=true;
                      }else {
                        isLast=false;
                      }

                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: RegisterCubit.get(context).driverScreens.length,
                    controller: pageontroller,
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //  if(cubit.mcqExamPageNumber!=0)
                    Expanded(
                      child: CustomButton(
                        text: 'Back',
                        color: secondaryColor,
                        height: 40.h,
                        textColor: Colors.white,
                        radius: 12,
                        elevation: 0.0,
                        function: (){
                          pageontroller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                        },
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    // if(cubit.mcqExamPageNumber!=screens.length-1)
                    Expanded(
                      child: CustomButton(
                        text: 'Next',
                        color: secondaryColor,
                        textColor: Colors.white,
                        elevation: 0.0,
                        radius: 12,
                        height: 40.h,
                        function: (){
                          if(isLast){
                            navigateWithoutBack(context, DriverHomeLayout());
                          }else{
                            pageontroller.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
