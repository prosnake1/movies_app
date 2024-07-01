import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    on<CheckIfInCollection>(_checkIfInCol);
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

  Future<void> _checkIfInCol(
      CheckIfInCollection event, Emitter<CollectionState> emit) async {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        List<CollectionFilm> films = [];
        films = await fetchData();
        if (films.isEmpty) {
          emit(
            AddToCollection(
              icon: const Icon(Icons.add),
              filmInfo: await GetIt.I<AbstractFilmInfoRep>()
                  .getInfoList(id: event.id),
            ),
          );
        }
        for (var i in films) {
          if (i.kinopoiskId == event.id) {
            emit(
              RemoveFromCollection(
                icon: const Icon(Icons.remove),
                filmId: i.filmId,
              ),
            );
            return;
          } else {
            emit(
              AddToCollection(
                icon: const Icon(Icons.add),
                filmInfo: await GetIt.I<AbstractFilmInfoRep>()
                    .getInfoList(id: event.id),
              ),
            );
          }
        }
      }
    } catch (e, st) {
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
