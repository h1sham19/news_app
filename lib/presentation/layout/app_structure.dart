import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/presentation/screen/search_screen.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({Key? key}) : super(key: key);

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "News app",
            ),
            actions: [
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    cubit.changeTheme();
                  },
                  icon: cubit.isDark
                      ? const ImageIcon(
                    AssetImage("assets/images/sun.gif"),
                    size: 30,
                  )
                      : const Icon(Icons.brightness_2_rounded)),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  SearchScreen()
                    ));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomBar(index);
            },
          ),
          body: cubit.screenNav[cubit.currentIndex],
        );
      },
    );
  }
}
