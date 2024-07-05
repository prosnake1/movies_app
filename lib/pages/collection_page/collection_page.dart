import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/pages/collection_page/bloc/collection_bloc.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:movie_app/theme/theme.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final _collectionBloc = GetIt.I.get<CollectionBloc>();

  @override
  void initState() {
    _collectionBloc.add(LoadCollectionList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.collection_page.title,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _collectionBloc.add(LoadCollectionList(completer: completer));
          completer.future;
        },
        child: BlocBuilder<CollectionBloc, CollectionState>(
          bloc: _collectionBloc,
          builder: (context, state) {
            if (state is LoadedCollectionList) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.filmsList.length,
                itemBuilder: (context, i) {
                  final film = state.filmsList[i];
                  return InkWell(
                    onTap: () {
                      var id = int.parse(film.kinopoiskId);
                      context.push('/film/$id', extra: id);
                    },
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: film.posterUrl,
                          width: 140.pw.width,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                film.filmName,
                                style: lightTheme.textTheme.titleMedium,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            if (state is CollectionListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
