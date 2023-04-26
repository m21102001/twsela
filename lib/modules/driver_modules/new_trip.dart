import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twsela/components/constants.dart';
import 'package:twsela/components/custom_button.dart';

import '../../components/default_app_bar.dart';

class NewTripScreen extends StatelessWidget {
  NewTripScreen({Key? key}) : super(key: key);
  var fromController = TextEditingController();
  var toController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'New Trip',
        withLeadingButton: true,
        leadingFunction: (){
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: fromController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'From',
                  prefixIcon: Icon(
                    Icons.location_pin,
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Location';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 26.h,),
              TextFormField(
                controller: toController,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'To',
                  prefixIcon: Icon(
                    Icons.location_pin,
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Location';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 26.h,),
              TextFormField(
                controller: timeController,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Start Time',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        timeController.text= picked.format(context).toString();
                      }
                    },
                    icon: Icon(Icons.access_time),
                  ),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Start Time';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 26.h,),
              TextFormField(
                controller: dateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Trip Date',
                  suffixIcon: IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024),
                      );
                      if (picked != null) {
                        dateController.text= picked.toString().substring(0,10);
                      }
                    },
                    icon: Icon(Icons.date_range),
                  ),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Start Time';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 26.h,),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                  ),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Enter Price';
                  }
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 36.h,),
              CustomButton(
                  text: 'Save',
                  height:35.h,
                  radius: 6,
                  fontSize: 18,
                  color: secondaryColor,
                  function: (){}
              ),
            ],
          ),
        ),
      ),

    );
  }
}

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    print('Selected time: ${picked.format(context)}');
  }
}