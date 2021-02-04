part of 'search_repos_cubit.dart';

@immutable
abstract class SearchReposState {}

class SearchReposInitial extends SearchReposState {}

class SearchReposSucces extends SearchReposState {
  final Repos repos;

  SearchReposSucces({this.repos});
}

class SearchReposStart extends SearchReposState {}

class SearchReposFailed extends SearchReposState {
  final String e;

  SearchReposFailed(this.e);
}
