

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twsela/modules/driver_sign_up/car/car_info.dart';
import 'package:twsela/modules/driver_sign_up/driver/criminal_records_certifications_page.dart';
import 'package:twsela/modules/driver_sign_up/driver/driver_license_page.dart';
import 'package:twsela/modules/driver_sign_up/driver/nationatl_id_page.dart';
import 'package:twsela/modules/register_screen/register_states.dart';
import '../../components/constants.dart';
import '../../models/models.dart';
import '../../shared/network/remote/dio_helper.dart';
import '../driver_sign_up/driver/basic_info.dart';


class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit():super(RegisterInitialState());


  static RegisterCubit get(context)=> BlocProvider.of(context);

  late ShopLoginModel loginModel;            /////

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name':name,
        'phone':phone,
        'email':email,
        'password':password,
      },

    ).then((value) {
      loginModel= ShopLoginModel.fromJson(value.data);           /////
      emit(RegisterSuccessState(loginModel: loginModel));
    }).catchError((error){
      print(error.toString()+'from reg cubit');
      emit(RegisterErrorState(error: error.toString()));
    });
  }


  bool isShown = false;
  void changePassword(){
    isShown=!isShown;
    emit(RegisterChangeState());
  }



    List<Widget> driverScreens=[
      BasicDriverInfoPage(),
      DriverLicensePage(),
      NationalIdPage(),
      CriminalRecordsCertificationsPage(),
      CarInfoPage(),
    ];

  List<String> appBarTitles=[
    'Basic Driver Information',
    'Driver License Information',
    'Driver National Id',
    'Criminal Records Certifications',
    'Car Information',
  ];

  int pageIndex=0;
  void changePageIndex(int index){
    pageIndex= index;
    emit(RegisterChangePageState());
  }

  File? userImage;
  Future<void> uploadUserImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      userImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }


  File? frontDriverLicenseImage;
  Future<void> uploadFrontDriverLicenseImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      frontDriverLicenseImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }



  File? backDriverLicenseImage;
  Future<void> uploadBackDriverLicenseImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      backDriverLicenseImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }




  File? frontNationalIdImage;
  Future<void> uploadFrontNationalIdImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      frontNationalIdImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }



  File? backNationalIdImage;
  Future<void> uploadBackNationalIdImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      backNationalIdImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }


  File? criminalRecordsImage;
  Future<void> uploadCriminalRecordsImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      criminalRecordsImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }



  File? frontCarLicenseImage;
  Future<void> uploadFrontCarLicenseImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      frontCarLicenseImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }



  File? backCarLicenseImage;
  Future<void> uploadBackCarLicenseImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      backCarLicenseImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }


  File? carImage;
  Future<void> uploadCarImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      carImage = File(pickedFile.path);
    }
    emit(UploadedUserImageState());
  }

}