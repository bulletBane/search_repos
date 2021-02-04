import 'package:flutter/material.dart';
import 'package:job_test/data/repository.dart';
import 'package:job_test/presentation/repo_widget.dart';
import 'package:job_test/presentation/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/colors.dart';

class ReposListPage extends StatefulWidget {
  final Repos repos;
  final String text;
  final int totalCount;
  ReposListPage({Key key, this.repos, this.text, this.totalCount})
      : super(key: key);

  @override
  _ReposListPageState createState() => _ReposListPageState();
}

class _ReposListPageState extends State<ReposListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          sAppBar(context, title: 'результат поиска'),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  queryTitle(query: widget.text),
                  Text(
                    'Найдено: ${widget.totalCount}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Clrs.gray,
                        fontSize: 10.ssp),
                  )
                ],
              )
            ])),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            return RepoWidget(
              repoName: widget.repos.items[i].name,
              updated: widget.repos.items[i].updatedAt,
              scores: widget.repos.items[i].score,
              userAvatarURL: widget.repos.items[i].owner.avatarUrl,
              userName: widget.repos.items[i].owner.login,
            );
          }, childCount: widget.repos.items.length))
        ],
      ),
    );
  }
}
