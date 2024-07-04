import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/pages/collection_page/bloc/collection_bloc.dart';
import 'package:movie_app/pages/film_page/bloc/film_info_bloc.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:movie_app/theme/theme.dart';

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
  final _filmInfoBloc = GetIt.I.get<FilmInfoBloc>();
  final _collectionBloc = CollectionBloc();
  @override
  void initState() {
    _collectionBloc.add(CheckIfInCollection(id: widget.id.toString()));
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
            final infoList = state.filmInfo[0];
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: infoList.posterUrl,
                      height: 300.ph.height,
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
                        SizedBox(
                          height: 20.ph.height,
                        ),
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
          DatabaseReference filmRef = FirebaseDatabase.instance
              .ref()
              .child('films')
              .child(FirebaseAuth.instance.currentUser!.uid);
          if (state is AddToCollection) {
            return FloatingActionButton(
              onPressed: () async {
                final film = state.filmInfo[0];
                String? filmId = filmRef.push().key.toString();
                await filmRef.child(filmId.toString()).set(
                  {
                    'filmName': film.nameRu ?? film.nameOriginal,
                    'filmId': filmId,
                    'kinopoiskId': widget.id,
                    'posterUrl': film.posterUrl,
                  },
                );
                _collectionBloc.add(
                  CheckIfInCollection(
                    id: widget.id.toString(),
                  ),
                );
              },
              child: state.icon,
            );
          }
          if (state is RemoveFromCollection) {
            return FloatingActionButton(
              onPressed: () async {
                await filmRef.child(state.filmId).remove();
                _collectionBloc
                    .add(CheckIfInCollection(id: widget.id.toString()));
              },
              child: state.icon,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
