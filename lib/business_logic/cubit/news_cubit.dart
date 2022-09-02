import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/presentation/screen/business_screen.dart';
import 'package:news_app/presentation/screen/science_screen.dart';
import 'package:news_app/presentation/screen/setting_screen.dart';
import 'package:news_app/presentation/screen/sport_screen.dart';
import 'package:news_app/presentation/screen/technology_screen.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  bool isDark=false;
  int currentIndex = 0;
  String url = "v2/everything/";
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> technology = [];
  List<dynamic> science = [];
  static NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business, size: 30), label: "business"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
          size: 30,
        ),
        label: "science"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
          size: 30,
        ),
        label: "sports"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.computer,
          size: 30,
        ),
        label: "technology"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
          size: 30,
        ),
        label: "setting"),
  ];

  List<Widget> screenNav = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    TechnologyScreen(),
    SettingScreen()
  ];

  void changeBottomBar(int index) {
    currentIndex = index;
    if (index == 1) getScienceNews();
    if (index == 2) getSportsNews();
    if (index == 3) getTechNews();
    emit(NewsBottomNevigaterState());
  }

  void getBusinessNews() {
    emit(NewsGetBusinessLoadingState());
    if (business.length == 0) {
      NewsRepository.fetchData(url: url, query: {
        'q': 'business',
        'apiKey': "3ef1a706ea7c4afca323c69461290470"
      }).then((value) {
        business = value.data["articles"];
        emit(NewsGetBusinessSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetBusinessErrorState());
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getScienceNews() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      NewsRepository.fetchData(url: url, query: {
        'q': 'science',
        'apiKey': "3ef1a706ea7c4afca323c69461290470"
      }).then((value) {
        science = value.data["articles"];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSportsNews() {
    emit(NewsGetScienceLoadingState());
    if (sports.length == 0) {
      NewsRepository.fetchData(url: url, query: {
        'q': 'sports',
        'apiKey': "3ef1a706ea7c4afca323c69461290470"
      }).then((value) {
        sports = value.data["articles"];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }

  }

  void getTechNews() {
    emit(NewsGetScienceLoadingState());
    if (technology.length == 0) {
      NewsRepository.fetchData(url: url, query: {
        'q': 'technology',
        'apiKey': "3ef1a706ea7c4afca323c69461290470"
      }).then((value) {
        technology = value.data["articles"];
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState());
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void changeTheme(){
    isDark= !isDark;
    emit(ChangeThemeState());
  }
}
