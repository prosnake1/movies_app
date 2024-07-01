// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionFilm _$CollectionFilmFromJson(Map<String, dynamic> json) =>
    CollectionFilm(
      filmId: json['filmId'] as String,
      filmName: json['filmName'] as String,
      kinopoiskId: json['kinopoiskId'] as String,
      posterUrl: json['posterUrl'] as String,
    );

Map<String, dynamic> _$CollectionFilmToJson(CollectionFilm instance) =>
    <String, dynamic>{
      'filmId': instance.filmId,
      'filmName': instance.filmName,
      'kinopoiskId': instance.kinopoiskId,
      'posterUrl': instance.posterUrl,
    };
