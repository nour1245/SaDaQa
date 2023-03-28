import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_cubit.dart';
import 'package:quran/layout/layout.dart';
import 'package:quran/shared/network/local/cash_helper.dart';
import 'package:quran/shared/network/remote/diohelper.dart';

import 'shared/components/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();

  runApp(const MyApp());
  text = await CacheHelper.getData(key: 'text');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sadaqa',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 255, 251, 230),
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 251, 230),
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: BlocProvider(
        create: (context) => AppCubit()
          ..getMushaf()
          ..getRecitation(),
        child: const Directionality(
            textDirection: TextDirection.rtl, child: LayoutScreen()),
      ),
    );
  }
}
