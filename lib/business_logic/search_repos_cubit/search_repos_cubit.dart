import 'package:bloc/bloc.dart';
import 'package:job_test/data/repository.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'search_repos_state.dart';

class SearchReposCubit extends Cubit<SearchReposState> {
  SearchReposCubit() : super(SearchReposInitial());
  static final String _url = "api.github.com";

  void resetSearch() => emit(SearchReposInitial());

  Future getRepo({String text, int page = 0}) async {
    emit(SearchReposStart());
    final uri = Uri.https(_url, '/search/repositories', {
      'q': '$text',
      'sort': 'stars',
      'order': 'desc',
      'page': '$page',
      'per_page': '30'
    });
    try {
      http.Response responseRepos = await http.get(uri);
      print(responseRepos);
      Repos repos = reposFromJson(responseRepos.body);

      emit(SearchReposSucces(repos: repos));
      emit(SearchReposInitial());
    } on Exception catch (e) {
      emit(SearchReposFailed(e.toString()));
    }
  }
}
