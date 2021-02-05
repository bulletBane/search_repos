import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:job_test/presentation/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_test/presentation/shared/rus_locale.dart';

class RepoWidget extends StatelessWidget {
  final String userAvatarURL;
  final String repoName;
  final String userName;
  final int scores;
  final DateTime updated;

  const RepoWidget(
      {Key key,
      @required this.userAvatarURL,
      @required this.repoName,
      @required this.userName,
      @required this.scores,
      @required this.updated})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
          border: Border.all(color: Clrs.gray, width: 1.h),
          borderRadius: BorderRadius.circular(10.ssp)),
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Container(
                width: 230.w,
                child: Text(
                  repoName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14.ssp),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 9.w),
                decoration: BoxDecoration(
                    color: Clrs.gray,
                    borderRadius: BorderRadius.circular(50.ssp)),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.white,
                      size: 16.ssp,
                    ),
                    Text(
                      '$scores',
                      style: TextStyle(color: Colors.white, fontSize: 10.ssp),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    userAvatarURL,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                userName,
                style: TextStyle(fontSize: 10.ssp),
              )
            ],
          ),
          Divider(
            color: Clrs.grayBorder,
            thickness: 1.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(color: Clrs.gray, fontSize: 10.ssp),
                children: [
                  TextSpan(
                    text: 'Обновлено: ',
                  ),
                  TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: formatDate(updated, [d, ' ', MM],
                          locale: RusLocale()))
                ]),
          )
        ],
      ),
    );
  }
}
