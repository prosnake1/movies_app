import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_film.g.dart';

@JsonSerializable()
class CollectionFilm extends Equatable {
  const CollectionFilm({
    required this.filmId,
    required this.filmName,
    required this.kinopoiskId,
    required this.posterUrl,
  });
  final String filmId; // id в database
  final String filmName;
  final String kinopoiskId; // id в kinopoisk
  final String posterUrl;
  CollectionFilm.fromSnapshot(DataSnapshot snapshot)
      : filmId = (snapshot.value as Map<String, dynamic>?)?['filmId'] ?? '',
        filmName = (snapshot.value as Map<String, dynamic>?)?['filmName'] ?? '',
        kinopoiskId =
            (snapshot.value as Map<String, dynamic>?)?['kinopoiskId'] ?? '',
        posterUrl =
            (snapshot.value as Map<String, dynamic>?)?['posterUrl'] ?? '';
  factory CollectionFilm.fromJson(Map<String, dynamic> json) =>
      _$CollectionFilmFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionFilmToJson(this);

  @override
  List<Object?> get props => [filmId, filmName, kinopoiskId, posterUrl];
}
