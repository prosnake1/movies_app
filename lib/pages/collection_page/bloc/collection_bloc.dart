import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repositories/collection_films/model/model.dart';
import 'package:movie_app/repositories/database/service.dart';
import 'package:movie_app/repositories/film_info/film_info.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'collection_event.dart';
part 'collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<LoadCollectionList>(_loadList); // загрузка фильмов из бд
    on<AddFilm>(_addFilm);
    on<RemoveFilm>(_removeFilm);
  }
  DatabaseReference filmRef = FirebaseDatabase.instance
      .ref()
      .child('films')
      .child(FirebaseAuth.instance.currentUser!.uid);
  Future<void> _addFilm(AddFilm event, Emitter<CollectionState> emit) async {
    if (FirebaseAuth.instance.currentUser != null) {
      List<FilmInfo> filmInfo =
          await GetIt.I.get<AbstractFilmInfoRep>().getInfoList(id: event.id);
      await filmRef.child(filmInfo[0].kinopoiskId.toString()).set(
        {
          'filmName': filmInfo[0].nameRu ?? filmInfo[0].nameOriginal,
          'filmId': filmInfo[0].kinopoiskId,
          'kinopoiskId': filmInfo[0].kinopoiskId,
          'posterUrl': filmInfo[0].posterUrl,
        },
      );
      add(LoadCollectionList());
    }
  }

  Future<void> _removeFilm(
      RemoveFilm event, Emitter<CollectionState> emit) async {
    await filmRef.child(event.id.toString()).remove();
    add(LoadCollectionList());
  }

  Future<void> _loadList(
      LoadCollectionList event, Emitter<CollectionState> emit) async {
    try {
      emit(CollectionListLoading());
      if (FirebaseAuth.instance.currentUser != null) {
        emit(LoadedCollectionList(filmsList: await fetchData()));
      }
    } catch (e, st) {
      emit(CollectionListFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
