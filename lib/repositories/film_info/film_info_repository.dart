import 'package:dio/dio.dart';
import 'package:movie_app/repositories/dio/dio.dart';
import 'package:movie_app/repositories/film_info/film_info.dart';

class FilmInfoRepository implements AbstractFilmInfoRep {
  FilmInfoRepository({required this.dio});
  final Dio dio;
  @override
  Future<List<FilmInfo>> getInfoList({required id}) async {
    try {
      Response response = await dio.get('${Endpoints.baseUrl}${id.toString()}',
          options: options);
      if (response.statusCode == 200) {
        final data = response.data;
        final result = [
          FilmInfo(
            kinopoiskId: data['kinopoiskId'],
            nameRu: data['nameRu'],
            nameOriginal: data['nameOriginal'],
            nameEn: data['nameEn'],
            posterUrl: data['posterUrl'],
            year: data['year'],
            description: data['description'],
            countries: data['countries'].map((e) => e['country']).toList(),
            genres: data['genres'].map((e) => e['genre']).toList(),
          )
        ];
        return result;
      } else {
        throw Exception();
      }
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(e, stack);
    }
  }
}
