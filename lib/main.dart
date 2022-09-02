import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/data/web_services/new_web_services.dart';
import 'package:news_app/presentation/layout/app_structure.dart';
import 'package:news_app/style/theme/theme_app.dart';
import 'components/constant/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  NewsWebServices.init();
  runApp(DevicePreview(
    builder: (BuildContext context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
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
              home:AppStructure()

              );
        },
      ),
    );
  }
}
