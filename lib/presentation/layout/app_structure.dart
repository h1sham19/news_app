import 'package:flutter/material.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({Key? key}) : super(key: key);

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  @override
  Widget build(BuildContext context) {
    var cubit=NewsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News app"),
        actions: [IconButton(
            onPressed: () {
              //todo:search function to work
            },
            icon: Icon(Icons.search))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:cubit.bottomItem,
        currentIndex: cubit.currentIndex,
        onTap: (index){
          cubit.changeBottomBar(index);
        },
      ),
      body: cubit.screenNav[cubit.currentIndex],
    );
  }
}
