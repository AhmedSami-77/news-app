import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/src/controller/news_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.screensName[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomSheet(index);
            },
          ),
        );
      },
    );
  }
}
