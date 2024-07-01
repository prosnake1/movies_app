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
      final data = response.data;
      final films =
          (data['items'] as List).map((e) => TopFilm.fromJson(e)).toList();
      final result = films.sublist(0, 10);
      return result;
    } catch (e) {
      throw Error();
    }
  }
}
