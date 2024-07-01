import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repositories/film_info/film_info.dart';
import 'package:talker_flutter/talker_flutter.dart';
part 'film_info_event.dart';
part 'film_info_state.dart';

class FilmInfoBloc extends Bloc<FilmInfoEvent, FilmInfoState> {
  final AbstractFilmInfoRep filmInfoRep;
  FilmInfoBloc(this.filmInfoRep) : super(FilmInfoInitial()) {
    on<LoadInfoList>(_load);
  }
  Future<void> _load(LoadInfoList event, Emitter<FilmInfoState> emit) async {
    try {
      emit(InfoListLoading());
      emit(LoadedInfoList(
          filmInfo: await filmInfoRep.getInfoList(id: event.id)));
    } catch (e, st) {
      emit(InfoListFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
