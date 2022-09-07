import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import 'package:news_app/components/constant/reusableComponent.dart';
import 'package:news_app/style/theme/theme_app.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var search = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (String value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter ur word to search";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefix: const Icon(
                      Icons.search,
                    ),
                    hintText: "search",
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    enabled: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: NewsCubit.get(context).isDark
                        ? const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xBB42772E)))
                        : OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: ThemeApp.primary)),
                  ),
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.black),

                ),
              ),
              Expanded(child: ConditionalView(search, context))
            ],
          ),
        );
      },
    );
  }
}
