part of 'film_info_bloc.dart';

abstract class FilmInfoEvent extends Equatable {}

class LoadInfoList extends FilmInfoEvent {
  LoadInfoList({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
