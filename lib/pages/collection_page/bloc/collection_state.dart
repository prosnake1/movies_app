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
