import 'package:dio/dio.dart';
import 'package:movie_app/repositories/dio/dio.dart';
import 'package:movie_app/repositories/top_films/top_films.dart';

class TopFilmsRepository implements AbstractTopFilmsRep {
  TopFilmsRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<TopFilm>> getTopFilmsList() async {
    try {
      Response response = await dio.get(
        Endpoints.top,
        options: options,
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final films =
            (data['items'] as List).map((e) => TopFilm.fromJson(e)).toList();
        final result = films.sublist(0, 10);
        return result;
      } else {
        throw Exception();
      }
    } on Object catch (e, stack) {
      throw Error.throwWithStackTrace(e, stack);
    }
  }
}
