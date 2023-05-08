

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twsela/components/core_components.dart';
import 'package:twsela/layout/home_layout.dart';
import 'package:twsela/modules/driver_sign_up/car/car_info.dart';
import 'package:twsela/modules/driver_sign_up/driver/criminal_records_certifications_page.dart';
import 'package:twsela/modules/driver_sign_up/driver/driver_license_page.dart';
import 'package:twsela/modules/driver_sign_up/driver/nationatl_id_page.dart';
import 'package:twsela/modules/login_screen/login_screen.dart';
import 'package:twsela/modules/register_screen/register_states.dart';
import '../../components/constants.dart';
import '../../models/models.dart';
import '../../models/user_model.dart';
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
    required String address,
    required context
  }){
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password).then((value) {

      createUser(name: name, email: email, phone: phone, uId: value.user!.uid, context: context);
      // emit(SocialAppRegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error: error.toString()));
    });
  }

  void  createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
    String? address,
    required context
  }){
    UserModel userModel=UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        address: address,
      type: 'passenger'
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap()).then((value) {
      navigateWithoutBack(context, LoginScreen());
      emit(CreateUserSuccessState());
    }).catchError((error){
      List<String>err= error.toString().split(']');
      emit(CreateUserErrorState(err.last));
    });

  }




  void createDriver({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required int buildingNumber,
    String? address,
    required context
  }){
    UserModel userModel=UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        address: address,
        type: 'passenger'
    );

    FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap()).then((value) {
      navigateWithoutBack(context, LoginScreen());
      emit(CreateUserSuccessState());
    }).catchError((error){
      List<String>err= error.toString().split(']');
      emit(CreateUserErrorState(err.last));
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