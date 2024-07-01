part of 'film_info_bloc.dart';

abstract class FilmInfoState extends Equatable {}

class FilmInfoInitial extends FilmInfoState {
  @override
  List<Object?> get props => [];
}

class LoadedInfoList extends FilmInfoState {
  LoadedInfoList({required this.filmInfo});
  final List<FilmInfo> filmInfo;
  @override
  List<Object> get props => [filmInfo];
}

class InfoListLoading extends FilmInfoState {
  @override
  List<Object?> get props => [];
}

class InfoListFailure extends FilmInfoState {
  InfoListFailure({required this.exception});
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}
