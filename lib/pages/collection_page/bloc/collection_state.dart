part of 'collection_bloc.dart';

abstract class CollectionState extends Equatable {}

class CollectionInitial extends CollectionState {
  @override
  List<Object?> get props => [];
}

class CollectionListLoading extends CollectionState {
  @override
  List<Object?> get props => [];
}

class LoadedCollectionList extends CollectionState {
  LoadedCollectionList({required this.filmsList});
  final List<CollectionFilm> filmsList;
  @override
  List<Object> get props => [filmsList];
}

class CollectionListFailure extends CollectionState {
  CollectionListFailure({required this.exception});
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}

// floating action button стейты

class AddToCollection extends CollectionState {
  AddToCollection({required this.icon, required this.filmInfo});
  final List<FilmInfo> filmInfo;
  final Icon icon;
  @override
  List<Object> get props => [filmInfo, icon];
}

class RemoveFromCollection extends CollectionState {
  RemoveFromCollection({required this.icon, required this.filmId});
  final Icon icon;
  final String filmId;

  @override
  List<Object> get props => [icon, filmId];
}
