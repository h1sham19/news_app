part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsBottomNavigaterState extends NewsState{}

class NewsGetBusinessSuccessState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}

class NewsGetBusinessErrorState extends NewsState{}