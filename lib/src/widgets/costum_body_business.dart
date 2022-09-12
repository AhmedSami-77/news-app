import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/controller/news_cubit.dart';
import 'package:newsapp/src/widgets/item_news.dart';

class BusinessWidget extends StatelessWidget {
   BusinessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
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
