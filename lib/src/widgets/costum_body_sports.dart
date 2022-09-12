import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/news_cubit.dart';
import 'item_news.dart';

class SportWidget extends StatelessWidget {
  const SportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return state is! NewsLoadingGetBusiness
            ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {

              return list[index]['urlToImage']==null?Container(): ItemNew(list[index]);
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child:list[index]['urlToImage']==null?Container(): Divider(
                thickness: 2,
              ),
            ),
            itemCount: list.length)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
