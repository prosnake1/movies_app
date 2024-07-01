// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedFilm _$SearchedFilmFromJson(Map<String, dynamic> json) => SearchedFilm(
      nameOriginal: json['nameOriginal'] as String?,
      nameRu: json['nameRu'] as String?,
      nameEn: json['nameEn'] as String?,
      year: json['year'] as String,
      posterUrl: json['posterUrl'] as String,
      filmId: (json['filmId'] as num).toInt(),
    );

Map<String, dynamic> _$SearchedFilmToJson(SearchedFilm instance) =>
    <String, dynamic>{
      'nameOriginal': instance.nameOriginal,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'year': instance.year,
      'posterUrl': instance.posterUrl,
      'filmId': instance.filmId,
    };
