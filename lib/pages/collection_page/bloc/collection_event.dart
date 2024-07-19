part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {}

class LoadCollectionList extends CollectionEvent {
  LoadCollectionList({this.completer});
  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

class RemoveFilm extends CollectionEvent {
  RemoveFilm({required this.id, this.completer});
  final int id;
  final Completer? completer;
  @override
  List<Object?> get props => [id];
}

class AddFilm extends CollectionEvent {
  AddFilm({required this.id, this.completer});
  final int id;
  final Completer? completer;
  @override
  List<Object?> get props => [];
}
