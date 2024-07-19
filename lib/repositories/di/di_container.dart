import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/pages/collection_page/bloc/collection_bloc.dart';
import 'package:movie_app/pages/home_page/bloc/top_films_bloc.dart';
import 'package:movie_app/pages/search_page/bloc/searched_films_bloc.dart';
import 'package:movie_app/repositories/film_info/film_info.dart';
import 'package:movie_app/repositories/searched_films/searched_films.dart';
import 'package:movie_app/repositories/top_films/top_films.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

GetIt locator = GetIt.instance;
final talker = TalkerFlutter.init();
final dio = Dio();
void setup() {
  setupTalker();
  GetIt.I.registerLazySingleton<AbstractSearchedFilmsRep>(
    () => SearchedFilmsRepository(dio: dio),
  );
  GetIt.I.registerLazySingleton<AbstractTopFilmsRep>(
    () => TopFilmsRepository(dio: dio),
  );
  GetIt.I.registerLazySingleton<AbstractFilmInfoRep>(
    () => FilmInfoRepository(dio: dio),
  );
  // Bloc
  GetIt.I.registerLazySingleton<SearchedFilmBloc>(
    () => SearchedFilmBloc(GetIt.I.get<AbstractSearchedFilmsRep>()),
  );
  GetIt.I.registerLazySingleton<TopFilmsBloc>(
    () => TopFilmsBloc(GetIt.I.get<AbstractTopFilmsRep>()),
  );
  GetIt.I.registerLazySingleton<CollectionBloc>(
    () => CollectionBloc(),
  );
}

void setupTalker() {
  locator.registerSingleton<Talker>(talker);
  GetIt.I<Talker>().debug('Talker started...');
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
        printStateFullData: false, printEventFullData: false),
  );
  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );
}
