import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/data/cache_data/cache_pref.dart';
import 'package:news_app/data/web_services/new_web_services.dart';
import 'package:news_app/presentation/layout/app_structure.dart';
import 'package:news_app/style/theme/theme_app.dart';
import 'components/constant/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  NewsWebServices.init();
  await CacheData.init();

  bool? isDark = CacheData.getData(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NewsCubit()),
          BlocProvider(
              create: (context) => NewsCubit()
                ..getBusinessNews()
                ..getScienceNews()
                ..getSportsNews()
                ..getTechNews()
                ..changeTheme(sharedData: isDark))
        ],
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeApp.lightTheme,
                darkTheme: ThemeApp.darkTheme,
                themeMode: NewsCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const AppStructure());
          },
        ));
  }
}
