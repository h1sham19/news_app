import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget NewsView(articles, context) {
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
                "${articles["urlToImage"]}",
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "${articles['author']}",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              "${articles['title']}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${articles["publishedAt"]}",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SeparatNews() {
  return const SizedBox(
    height: 15,
  );
}

Widget ConditionalView(list,BuildContext context) {
  return ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView?.separated(
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SeparatNews(),
          itemCount: list.length,
          itemBuilder: (context, index) => NewsView(list[index], context)),
      fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
}
