import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/news_cubit.dart';
import '../../components/constant/reusableComponent.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(listener: (context, state) {}, builder: (context, state) {
      var business = NewsCubit.get(context).business;
      return ConditionalView(business,context);
    });
  }
}
