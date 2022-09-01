import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/screen/business_screen.dart';
import 'package:news_app/presentation/screen/science_screen.dart';
import 'package:news_app/presentation/screen/sport_screen.dart';
import 'package:news_app/presentation/screen/technology_screen.dart';

import '../../data/web_services/new_web_services.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  int currentIndex = 0;
  List<dynamic> business = [];
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
  ];

  List<Widget> screenNav = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    Technologyscreen()
  ];

  void changeBottomBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavigaterState());
  }

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    NewsWebServices.getNews(
        url: "v2/top-headlines/sources",
        query: {'apiKey': "3ef1a706ea7c4afca323c69461290470"}).then((value) {
      business = value.data["sources"];
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetBusinessErrorState());
    });
  }
}
