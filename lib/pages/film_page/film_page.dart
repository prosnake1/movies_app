import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/pages/collection_page/bloc/collection_bloc.dart';
import 'package:movie_app/pages/film_page/bloc/film_info_bloc.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:movie_app/theme/theme.dart';

import '../../repositories/film_info/film_info.dart';

class FilmPage extends StatefulWidget {
  final int id;
  const FilmPage({
    super.key,
    required this.id,
  });

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  final _filmInfoBloc = FilmInfoBloc(GetIt.I.get<AbstractFilmInfoRep>());
  final _collectionBloc = GetIt.I.get<CollectionBloc>();
  @override
  void initState() {
    _filmInfoBloc.add(LoadInfoList(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.film_page.title),
      ),
      body: BlocBuilder<FilmInfoBloc, FilmInfoState>(
        bloc: _filmInfoBloc,
        builder: (context, state) {
          if (state is LoadedInfoList) {
            _collectionBloc.add(LoadCollectionList());
            final infoList = state.filmInfo[0];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: infoList.posterUrl,
                      height: 300,
                      alignment: Alignment.center,
                    ),
                  ),
                  Text(
                    context.t.language == "English"
                        ? infoList.nameEn ??
                            infoList.nameOriginal ??
                            infoList.nameRu ??
                            ''
                        : infoList.nameRu ?? infoList.nameOriginal ?? '',
                    style: lightTheme.textTheme.titleLarge,
                  ),
                  Text(
                    infoList.year.toString(),
                    style: lightTheme.textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Text(
                          infoList.countries!.join(', ').toString(),
                          style: lightTheme.textTheme.titleMedium,
                        ),
                        Text(
                          infoList.genres!.join(', ').toString(),
                          style: lightTheme.textTheme.titleMedium,
                        ),
                        20.ph,
                        Text(
                          infoList.description ?? '',
                          style: lightTheme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is InfoListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is InfoListFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Что-то пошло не так...',
                  ),
                  IconButton(
                    onPressed: () => _filmInfoBloc.add(
                      LoadInfoList(
                        id: widget.id,
                      ),
                    ),
                    icon: const Icon(
                      Icons.replay_outlined,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: BlocBuilder<CollectionBloc, CollectionState>(
        bloc: _collectionBloc,
        builder: (context, state) {
          if (state is LoadedCollectionList) {
            bool collected = state.filmsList
                .any((film) => widget.id.toString() == film.kinopoiskId);
            if (collected == true) {
              return FloatingActionButton(
                onPressed: () {
                  _collectionBloc.add(RemoveFilm(id: widget.id));
                },
                child: const Icon(Icons.favorite),
              );
            } else {
              return FloatingActionButton(
                onPressed: () async {
                  final completer = Completer();
                  _collectionBloc
                      .add(AddFilm(id: widget.id, completer: completer));
                  completer.future;
                },
                child: const Icon(Icons.favorite_border),
              );
            }
          }
          if (state is CollectionListLoading) {
            return FloatingActionButton(
              onPressed: () {},
              child: const CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
