part of 'top_films_bloc.dart';

abstract class TopFilmsState extends Equatable {}

class TopFilmsInitial extends TopFilmsState {
  @override
  List<Object?> get props => [];
}

class LoadedTopFilmsList extends TopFilmsState {
  LoadedTopFilmsList({required this.topFilms});
  final List<TopFilm> topFilms;

  @override
  List<Object?> get props => [topFilms];
}

class TopFilmsListFailure extends TopFilmsState {
  TopFilmsListFailure({required this.exception});
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}

class TopFilmsLoading extends TopFilmsState {
  @override
  List<Object?> get props => [];
}
