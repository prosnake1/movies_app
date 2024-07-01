import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repositories/top_films/top_films.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'top_films_event.dart';
part 'top_films_state.dart';

class TopFilmsBloc extends Bloc<TopFilmsEvent, TopFilmsState> {
  final AbstractTopFilmsRep topFilmsRep;
  TopFilmsBloc(this.topFilmsRep) : super(TopFilmsInitial()) {
    on<LoadTopFilmsList>(_load);
  }
  Future<void> _load(
      LoadTopFilmsList event, Emitter<TopFilmsState> emit) async {
    try {
      emit(TopFilmsLoading());
      List<TopFilm> topFilms = await topFilmsRep.getTopFilmsList();
      emit(LoadedTopFilmsList(topFilms: topFilms));
    } catch (e, st) {
      emit(TopFilmsListFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
