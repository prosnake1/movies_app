part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {}

class LoadCollectionList extends CollectionEvent {
  LoadCollectionList({this.completer});
  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

// floating action button ивенты ниже
class CheckIfInCollection extends CollectionEvent {
  CheckIfInCollection({required this.id});
  final String id;
  @override
  List<Object> get props => [id];
}
