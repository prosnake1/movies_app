part of 'searched_films_bloc.dart';

abstract class SearchedFilmState {}

class SearchedFilmInitial extends SearchedFilmState {}

class SearchedFilmsLoading extends SearchedFilmState {}

class LoadedFilmsList extends SearchedFilmState {
  LoadedFilmsList({required this.filmsList, required this.pagesCount});
  final List<SearchedFilm> filmsList;
  final int pagesCount;
}

class LoadedFilmsListNull extends SearchedFilmState {}

class SearchedFilmsListFailure extends SearchedFilmState {
  SearchedFilmsListFailure({required this.exception});
  final Object? exception;
}
