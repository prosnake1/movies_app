part of 'searched_films_bloc.dart';

abstract class SearchedFilmEvent {}

class LoadFilmsList extends SearchedFilmEvent {
  LoadFilmsList({required this.query, required this.clear});
  final String query;
  final bool clear;
}
