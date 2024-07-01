import 'package:movie_app/repositories/film_info/model/film_info.dart';

abstract class AbstractFilmInfoRep {
  Future<List<FilmInfo>> getInfoList({required id});
}
