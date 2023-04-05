import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twsela/components/constants.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/components/custom_button.dart';
import 'package:twsela/components/default_app_bar.dart';
import 'package:twsela/modules/register_screen/register_cubit.dart';
import 'package:twsela/modules/register_screen/register_states.dart';

class CarInfoPage extends StatelessWidget {
  CarInfoPage({Key? key}) : super(key: key);
  TextEditingController carTypeController= TextEditingController();
  TextEditingController carModelController= TextEditingController();
  TextEditingController carColorController= TextEditingController();
  TextEditingController numberPlateController= TextEditingController();
  TextEditingController transportYearController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state){},
        builder: (context, state)=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Car Information',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              CustomTextFormField(
                  controller: carTypeController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Car Type',
                  enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: carModelController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  inputType: TextInputType.text,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Car Model',
                  enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: carColorController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  inputType: TextInputType.text,
                  radius: 12,
                  text: 'Car Color',
                  enabledBorderColor: Colors.grey
              ),


              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: numberPlateController,
                  validator: (value){},
                  context: context,
                  inputType: TextInputType.text,
                  height: 50.h,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Plate Number',
                  enabledBorderColor: Colors.grey
              ),
              SizedBox(height: 20.h,),
              CustomTextFormField(
                  controller: transportYearController,
                  validator: (value){},
                  context: context,
                  height: 50.h,
                  inputType: TextInputType.number,
                  verticalPadding: 12,
                  horizontalPadding: 12,
                  radius: 12,
                  text: 'Transport Year',
                  enabledBorderColor: Colors.grey
              ),


              SizedBox(height: 40.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Front Photo Of Car\'s License',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).frontCarLicenseImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).frontCarLicenseImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Add Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadFrontCarLicenseImage();
                },
              ),
              SizedBox(height: 40.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Back Photo Of Car\'s License',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).backCarLicenseImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).backCarLicenseImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Add Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadBackCarLicenseImage();
                },
              ),


              SizedBox(height: 40.h,),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Photo Of Your Car',
                  style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 8.h,),
              Container(
                height: 200.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ConditionalBuilder(
                  condition: RegisterCubit.get(context).carImage==null,
                  builder: (context)=> Image.asset('assets/images/certification.jpg', fit: BoxFit.cover,),
                  fallback: (context)=> Image.file(RegisterCubit.get(context).carImage!, fit: BoxFit.cover,),
                ) ,
              ),
              SizedBox(height: 16.h,),

              CustomButton(
                text: 'Add Photo',
                color: primaryColor,
                radius: 12,
                height: 40.h,
                textColor: Colors.black,
                elevation: 0.0,
                function: (){
                  RegisterCubit.get(context).uploadCarImage();
                },
              ),

              SizedBox(height: 70.h,),
            ],
          ),
        ),
      ),
    );
  }
}
