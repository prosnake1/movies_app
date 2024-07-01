import 'package:dio/dio.dart';
import 'package:movie_app/repositories/dio/dio.dart';
import 'package:movie_app/repositories/searched_films/searched_films.dart';

class SearchedFilmsRepository implements AbstractSearchedFilmsRep {
  SearchedFilmsRepository({required this.dio});
  final Dio dio;
  @override
  Future<dynamic> getFilmsList({required query, page}) async {
    Response response = await dio.get(
      '${Endpoints.exUrl}search-by-keyword?keyword=$query&page=$page',
      options: options,
    );
    return response.data;
  }
}
