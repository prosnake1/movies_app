import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/i18n/strings.g.dart';
import 'package:movie_app/pages/home_page/bloc/top_films_bloc.dart';
import 'package:movie_app/pages/home_page/widgets/widgets.dart';
import 'package:movie_app/repositories/sizes/custom_padding.dart';
import 'package:movie_app/repositories/top_films/top_films.dart';
import 'package:movie_app/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _topFilmsBloc = TopFilmsBloc(GetIt.I<AbstractTopFilmsRep>());
  @override
  void initState() {
    _topFilmsBloc.add(LoadTopFilmsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.home_page.home_title,
          style: lightTheme.textTheme.titleLarge,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: lightTheme.hoverColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.account_circle_outlined),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.email ??
                        context.t.errors.null_user,
                    style: lightTheme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            DrawerItem(
              icon: Icons.language_outlined,
              title: context.t.home_page.russian,
              onTap: () => LocaleSettings.setLocale(AppLocale.ru),
            ),
            DrawerItem(
              icon: Icons.language_outlined,
              title: context.t.home_page.english,
              onTap: () => LocaleSettings.setLocale(AppLocale.en),
            ),
            DrawerItem(
              icon: Icons.logout_outlined,
              title: context.t.home_page.logout,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => const SignOutAlertDialog());
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Text(
              context.t.home_page.top_10_pop_films,
              style: lightTheme.textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: BlocBuilder<TopFilmsBloc, TopFilmsState>(
              bloc: _topFilmsBloc,
              builder: (context, state) {
                if (state is LoadedTopFilmsList) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    shrinkWrap: true,
                    itemCount: state.topFilms.length,
                    itemBuilder: (context, i) {
                      final film = state.topFilms[i];
                      return InkWell(
                        onTap: () => context.push('/film/${film.kinopoiskId}',
                            extra: film.kinopoiskId),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.pw.width,
                              child: Center(
                                child: Text((i + 1).toString(),
                                    style: lightTheme.textTheme.titleLarge),
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl: film.posterUrl,
                              width: 140.pw.width,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.t.language == "English"
                                        ? film.nameEn ??
                                            film.nameOriginal ??
                                            film.nameRu ??
                                            ''
                                        : film.nameRu ??
                                            film.nameOriginal ??
                                            '',
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
                if (state is TopFilmsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TopFilmsListFailure) {
                  return Center(
                    child: Text(context.t.errors.smth_went_wrong),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () => context.push('/collection'),
                    child: Text(context.t.home_page.collection),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () => context.push('/search'),
                    child: Text(context.t.home_page.search_films),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
