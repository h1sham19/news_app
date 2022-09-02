part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNevigaterState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class NewsGetBusinessErrorState extends NewsState{}

class NewsGetScienceLoadingState extends NewsState{}

class NewsGetScienceSuccessState extends NewsState{}

class NewsGetScienceErrorState extends NewsState{}

class NewsGetSportsLoadingState extends NewsState{}

class NewsGetSportsSuccessState extends NewsState{}

class NewsGetSportsErrorState extends NewsState{}

class NewsGetTechLoadingState extends NewsState{}

class NewsGetTechSuccessState extends NewsState{}

class NewsGetTechErrorState extends NewsState{}

class ChangeThemeState extends NewsState{}
