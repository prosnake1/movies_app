part of 'top_films_bloc.dart';

abstract class TopFilmsEvent extends Equatable {}

class LoadTopFilmsList extends TopFilmsEvent {
  @override
  List<Object?> get props => [];
}
