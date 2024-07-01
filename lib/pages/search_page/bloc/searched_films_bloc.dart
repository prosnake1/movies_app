import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repositories/searched_films/searched_films.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'searched_films_event.dart';
part 'searched_films_state.dart';

class SearchedFilmBloc extends Bloc<SearchedFilmEvent, SearchedFilmState> {
  final AbstractSearchedFilmsRep filmsRep;
  SearchedFilmBloc(this.filmsRep) : super(SearchedFilmInitial()) {
    on<LoadFilmsList>(_load);
  }
  List<SearchedFilm> filmsList = [];
  int page = 1;
  int pagesCount = 0;
  Future<void> _load(
      LoadFilmsList event, Emitter<SearchedFilmState> emit) async {
    final filmsCount = filmsList.length;
    try {
      emit(SearchedFilmsLoading());
      if (event.clear) {
        filmsList.clear();
        page = 1;
        pagesCount = 0;
      }
      if (filmsCount == pagesCount && event.clear == false) {
        emit(
          LoadedFilmsList(
            filmsList: filmsList,
            pagesCount: pagesCount,
          ),
        );
      } else {
        final data =
            await filmsRep.getFilmsList(query: event.query, page: page);
        page++;
        pagesCount = data['pagesCount'];

        List<SearchedFilm> films = (data['films'] as List)
            .map((json) => SearchedFilm.fromJson(json))
            .toList();
        filmsList.addAll(films);
        emit(LoadedFilmsList(
          filmsList: filmsList,
          pagesCount: pagesCount,
        ));
        if (films.isEmpty && event.query != '') {
          emit(LoadedFilmsListNull());
        }
      }
    } catch (e, st) {
      emit(SearchedFilmsListFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
