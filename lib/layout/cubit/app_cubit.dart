
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twsela/layout/cubit/shop_states.dart';
import 'package:twsela/modules/driver_modules/driver_trips_screen.dart';
import 'package:twsela/modules/home_pages/profile_screen.dart';
import '../../components/constants.dart';
import '../../modules/home_pages/my_trips_screen.dart';
import '../../modules/home_pages/promotions_screen.dart';
import '../../modules/home_pages/map_screen.dart';
import '../../modules/home_pages/settings_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super (AppInitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  List<Widget> bodyScreens=[
    MapScreen(),
    MyTripsScreen(),
    PromotionsScreen(),
    //SettingsScreen(),
    ProfileScreen(),
  ];

  List<Widget> driverBodyScreens=[
    MapScreen(),
    DriverTripsScreen(),
    ProfileScreen(),
  ];

  int driverCurrentIndex=0;
  void changeDriverBottomNavBarItem(int index){
    driverCurrentIndex = index;
    emit(ChangeDriverBottomNavBarItemState());
  }


  int currentIndex=0;
  void changeBottomNavBarItem(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarItemState());
  }


  int profileIndex=0;
  void changeProfileIndex(int index){
    profileIndex= index;
    emit(AppChangeProfileIndexState());
  }

  /*
   HomeModel? model;
   Map<int,bool> favorites={};
  void getProductsData(){
    emit(ShopLoadingState());
    DioHelper.getData(
        url: HOME,
      token: token,
    ).then((value) {
         model = HomeModel.fromJson(value.data);
         model!.data.products.forEach((element) {
           favorites.addAll({
             element.id:element.inFavorite,
           });
         });
        emit(ShopSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorState(error: error.toString(),));
    });
  }

   CategoriesModel? categoriesModel;
  void getCategoriesData(){
    DioHelper.getData(
        url: CATEGORIES,
        token: token,
    ).then((value) {
      categoriesModel=CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print('error in get categories data ${error.toString()}');
      emit(ShopErrorCategoriesState(error: error));
    });
  }


  ChangeFavoritesModel? favoritesModel;
  void changeFavorites(int productId){
    if(favorites[productId]==true) {
      favorites[productId]=false;
    } else {
      favorites[productId]=true;
    }
    emit(ShopSuccessChangeFavoritesState());
    DioHelper.postData(
        url: FAVORITES,
        data:{'product_id':productId},
        token: token,
    ).then((value){
      favoritesModel = ChangeFavoritesModel.fromJson(value.data);
      if(!favoritesModel!.status){
        if(favorites[productId]==true) {
          favorites[productId]=false;
        } else {
          favorites[productId]=true;
        }
      }else {
        getFavoritesData();
      }
      emit(ShopSuccessFavoritesState(model: favoritesModel));
    }).catchError((error){
      if(!favoritesModel!.status){
        if(favorites[productId]==true) {
          favorites[productId]=false;
        } else {
          favorites[productId]=true;
        }
      }else {
        getFavoritesData();
      }
      emit(ShopErrorFavoritesState(error: error));
    });
  }


  FavoritesModel? favModel;
  void getFavoritesData(){
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favModel=FavoritesModel.fromJson(value.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print('error in get favorites data ${error.toString()}');
      emit(ShopErrorGetFavoritesState(error: error));
    });
  }

  
   ShopLoginModel? userDataModel;
  void getUserData(){
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(
        url: PROFILE,
        token: token,
    ).then((value) {
      userDataModel=ShopLoginModel.fromJson(value.data);
      print(userDataModel!.data!.name.toString());
      print(userDataModel!.data!.email.toString());
      emit(ShopSuccessGetUserDataState());
    }).catchError((error){
      print(error.toString()+' from get user data in shop cubit');
      emit(ShopErrorGetUserDataState(error: error.toString()));
    });

  }
  
  

  void updateUserData({
    required String name,
    required String email,
    required String phone,
}){
    emit(ShopLoadingUpdateUserDataState());
    DioHelper.putData(
        url: UPDATE_PROFILE,
        token: token,
        data: {
          'name':name,
          'email':email,
          'phone':phone,
        },
    ).then((value) {
      userDataModel = ShopLoginModel.fromJson(value.data);
      userName= userDataModel!.data!.name;
      userEmail = userDataModel!.data!.email;
      userPhone = userDataModel!.data!.phone;

      userNameInCubit= userDataModel!.data!.name;
      userEmailInCubit = userDataModel!.data!.email;
      userPhoneInCubit = userDataModel!.data!.phone;
      emit(ShopSuccessUpdateUserDataState());
    }).catchError((error){
      emit(ShopErrorUpdateUserDataState(error: error));
    });
  }
*/

  String? userNameInCubit  ;
  String ? userEmailInCubit;
  String ? userPhoneInCubit;


}
