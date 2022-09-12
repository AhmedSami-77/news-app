

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:newsapp/src/constant/strings.dart';
import 'package:newsapp/src/data/dio_helper.dart';
import 'package:newsapp/src/widgets/costum_body_business.dart';
import 'package:newsapp/src/widgets/costum_body_science.dart';
import 'package:newsapp/src/widgets/costum_body_sports.dart';
import 'package:newsapp/src/widgets/costum_body_settings.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    BusinessWidget(),
    SportWidget(),
    ScienceWidget(),
    SettingsWidget()
  ];
  List<String> screensName = ['Business', 'Sports', 'Science', 'Settings'];

  void changeBottomSheet(int index) {
    if (index == 1) {
      getSportsData();
    } else if (index == 2) {
      getScienceData();
    }
    currentIndex = index;
    emit(NewsChangeBottomSheet());
  }

  void getBusinessData() {
    emit(NewsLoadingGetBusiness());
    DioHelper.getData(
      methodUrl: kMethodUrl,
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];

      emit(NewsGetBusinessSuccess());
    }).catchError((error) {
      print('there is some error in getBusinessData the error is $error');
      emit(NewsGetBusinessError(error));
    });
  }

  void getSportsData() {
    emit(NewsLoadingGetSports());
    if (sports.isNotEmpty) {
      emit(NewsGetSportsSuccess());
    } else {
      DioHelper.getData(
        methodUrl: kMethodUrl,
        query: {
          'country': 'eg',
          'category': 'sports',
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        sports = value.data['articles'];

        emit(NewsGetSportsSuccess());
      }).catchError((error) {
        print('there is some error in getBusinessData the error is $error');
        emit(NewsGetSportsError(error));
      });
    }
  }

  void getScienceData() {
    emit(NewsLoadingGetScience());
    if (science.isNotEmpty) {
      emit(NewsGetScienceSuccess());
    } else {
      DioHelper.getData(
        methodUrl: kMethodUrl,
        query: {
          'country': 'eg',
          'category': 'science',
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];

        emit(NewsGetScienceSuccess());
      }).catchError((error) {
        print('there is some error in getBusinessData the error is $error');
        emit(NewsGetScienceError(error));
      });
    }
  }
}
