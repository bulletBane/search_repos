import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/business_logic/search_repos_cubit/search_repos_cubit.dart';
import 'package:job_test/presentation/shared/colors.dart';
import 'package:job_test/presentation/repos_list_page.dart';
import 'package:job_test/presentation/widgets.dart';

class SearchReposPage extends StatefulWidget {
  SearchReposPage({Key key}) : super(key: key);

  @override
  _SearchReposPageState createState() => _SearchReposPageState();
}

class _SearchReposPageState extends State<SearchReposPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  String text;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchReposCubit, SearchReposState>(
        listener: (context, state) {
          if (state is SearchReposSucces) {
            setState(() {
              text = _controller.text;
              _controller.text = '';
            });
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReposListPage(
                    text: text,
                    totalCount: state.repos.totalCount,
                    repos: state.repos,
                  ),
                ));
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(title: "Поиск"),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: BlocBuilder<SearchReposCubit, SearchReposState>(
                builder: (context, state) {
                  if (state is SearchReposStart) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Ищем ваши репозитории.."),
                          SizedBox(
                            height: 8,
                          ),
                          CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Clrs.blue),
                          )
                        ],
                      ),
                    );
                  }
                  if (state is SearchReposFailed) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.e),
                          TextButton(
                              onPressed: () =>
                                  BlocProvider.of<SearchReposCubit>(context)
                                      .resetSearch(),
                              child: Text('Искать заново'))
                        ],
                      ),
                    );
                  }
                  if (state is SearchReposInitial) {
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: searchFiled(
                            controller: _controller,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                BlocProvider.of<SearchReposCubit>(context)
                                    .getRepo(text: _controller.text);
                              }
                            }),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )));
  }
}
