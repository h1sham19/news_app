import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      var News = NewsCubit.get(context).business;
      return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context) => ListView?.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: News.length,
              itemBuilder: (context, index) => NewsView(News[index])),
          fallback: (context) => Center(
                child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/images/loadingNews.gif')),
              ));
    });
  }

  Widget NewsView(sources) {
    return Container(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 7,
                child: Image.network(
                  "https://newsroom.pinterest.com/sites/pinnews/files/post_main_content_image/2018-02/pinterest-100-blog.jpg",
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  sources['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xff79828B)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                "${sources['description']}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "3 hour",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA3A3A3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
