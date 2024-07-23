import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/pages/search_page/bloc/searched_films_bloc.dart';
import 'package:movie_app/repositories/searched_films/searched_films.dart';
import 'package:movie_app/theme/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchedFilmBloc =
      SearchedFilmBloc(GetIt.I.get<AbstractSearchedFilmsRep>());
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.t.search_page.search),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              onSubmitted: (value) {
                _searchedFilmBloc.add(
                  LoadFilmsList(
                    query: value,
                    clear: true,
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<SearchedFilmBloc, SearchedFilmState>(
                bloc: _searchedFilmBloc,
                builder: (context, state) {
                  if (state is LoadedFilmsList) {
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        height: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: state.filmsList.length,
                      itemBuilder: (context, i) {
                        final film = state.filmsList[i];
                        return InkWell(
                          onTap: () => context.push(
                            '/film/${film.filmId}',
                            extra: film.filmId,
                          ),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: film.posterUrl,
                                width: 140,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (context.t.language == 'English'
                                              ? film.nameEn
                                              : film.nameRu) ??
                                          film.nameRu ??
                                          context.t.errors.unknown,
                                      style: lightTheme.textTheme.titleMedium,
                                      overflow: TextOverflow.fade,
                                    ),
                                    Text(
                                      film.year.toString(),
                                      style: lightTheme.textTheme.titleMedium,
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
                  if (state is SearchedFilmsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SearchedFilmsListFailure) {
                    return Center(
                      child: Text(context.t.errors.smth_went_wrong),
                    );
                  }
                  if (state is LoadedFilmsListNull) {
                    return Center(
                      child: Text(
                        context.t.search_page.no_founded_films,
                        style: lightTheme.textTheme.titleMedium,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
