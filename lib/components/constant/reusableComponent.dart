import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

 Widget NewsView(articles) {
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
              "${articles['title']}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "${articles["publishedAt"]}",
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

Widget SeparatNews(){
   return const SizedBox(
     height: 15,
   );
}

Widget ConditionalView(list){
   return ConditionalBuilder(
       condition: list.length>0,
       builder: (context) => ListView?.separated(
           physics: const BouncingScrollPhysics(),
           separatorBuilder: (context, index) => SeparatNews(),
           itemCount: list.length,
           itemBuilder: (context, index) => NewsView(list[index])),
       fallback: (context) => Center(
         child: SizedBox(
             height: 120,
             width: 120,
             child: Image.asset('assets/images/loadingNews.gif')),
       ));
}