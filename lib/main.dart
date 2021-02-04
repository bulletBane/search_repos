import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_test/business_logic/search_repos_cubit/search_repos_cubit.dart';
import 'package:job_test/presentation/shared/colors.dart';
import 'package:job_test/presentation/search_page.dart';

void main() {
  runApp(ScreenUtilInit(
      allowFontScaling: true, designSize: Size(375, 667), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: Clrs.blue,
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 14.h),
              textStyle: TextStyle(fontSize: 12.ssp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.ssp))),
        ),
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black),
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => SearchReposCubit(),
        child: SearchReposPage(),
      ),
    );
  }
}
