import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/src/controller/news_cubit.dart';
import 'package:newsapp/src/data/dio_helper.dart';
import 'package:newsapp/src/screens/home.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News app',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                centerTitle: true),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,
            ),
            primarySwatch: Colors.blue,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange)),
        home: HomeScreen(),
      ),
    );
  }
}
