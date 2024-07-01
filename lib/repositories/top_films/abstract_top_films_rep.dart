import 'package:movie_app/repositories/top_films/top_films.dart';

abstract class AbstractTopFilmsRep {
  Future<List<TopFilm>> getTopFilmsList();
}
