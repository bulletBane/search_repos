import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_test/business_logic/search_repos_cubit/search_repos_cubit.dart';
import 'shared/colors.dart';

AppBar appBar({@required String title}) {
  return AppBar(
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    bottom: PreferredSize(
        child: Divider(
          height: 0,
          thickness: 1.h,
          color: Clrs.grayBorder,
        ),
        preferredSize: Size.fromHeight(1.h)),
  );
}

SliverAppBar sAppBar(BuildContext context, {@required String title}) {
  return SliverAppBar(
    elevation: 0,
    pinned: true,
    floating: true,
    snap: true,
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        BlocProvider.of<SearchReposCubit>(context).resetSearch();
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.black,
        size: 16.ssp,
      ),
    ),
    bottom: PreferredSize(
        child: Divider(
          height: 0,
          thickness: 1.h,
          color: Clrs.grayBorder,
        ),
        preferredSize: Size.fromHeight(1.h)),
    title: Text(title,
        style: TextStyle(
          color: Colors.black,
        )),
  );
}

RichText queryTitle({@required String query}) {
  return RichText(
      text: TextSpan(
          style: TextStyle(
              letterSpacing: 0.9.w,
              color: Clrs.gray,
              fontSize: 10.ssp,
              fontWeight: FontWeight.w600),
          children: [
        TextSpan(text: 'по запросу: '.toUpperCase()),
        TextSpan(
            text: '"$query"'.toUpperCase(),
            style: TextStyle(
                color: Clrs.blue,
                fontSize: 10.ssp,
                fontWeight: FontWeight.w600))
      ]));
}

OutlineInputBorder border(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.ssp),
      borderSide: BorderSide(color: color, width: 1.h));
}

TextButton searchButton({VoidCallback onPressed}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        'Найти',
        style: TextStyle(color: Colors.white, fontSize: 12.ssp),
      ));
}

TextStyle gray600TextStyle({FontWeight fontWeight}) {
  return TextStyle();
}

Widget searchFiled({VoidCallback onPressed, TextEditingController controller}) {
  return Center(
      child: SizedBox(
    height: 50.h,
    width: 343.w,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.ssp),
          border: border(Clrs.grayBorder),
          focusedBorder: border(Clrs.blue),
          errorBorder: border(Clrs.red),
          hintText: 'Введите название репозитория',
          suffixIcon: searchButton(onPressed: onPressed)),
    ),
  ));
}

// FlatButton searchButton({VoidCallback onPressed}) {
//   return FlatButton(
//       color: Clrs.blue,
//       shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.ssp)),
//       onPressed: onPressed,
//       child: Text(
//         'Найти',
//         style: TextStyle(color: Colors.white),
//       ));
// }
