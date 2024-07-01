import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/repositories/collection_films/model/model.dart';
import 'package:talker_flutter/talker_flutter.dart';

final DatabaseReference databaseRef = FirebaseDatabase.instance
    .ref()
    .child('films')
    .child(FirebaseAuth.instance.currentUser!.uid);

Future<List<CollectionFilm>> fetchData() async {
  List<CollectionFilm> filmsList = [];

  try {
    DatabaseEvent event = await databaseRef.once();
    DataSnapshot snapshot = event.snapshot;
    if (snapshot.value != null) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        CollectionFilm film = CollectionFilm(
            filmId: value['filmId'],
            filmName: value['filmName'],
            kinopoiskId: value['kinopoiskId'].toString(),
            posterUrl: value['posterUrl']);
        filmsList.add(film);
      });
    } else {
      GetIt.I<Talker>().debug('Data in Collection is Empty!');
    }
  } catch (error) {
    throw Error;
  }

  return filmsList;
}
