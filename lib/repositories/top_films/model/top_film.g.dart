// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopFilm _$TopFilmFromJson(Map<String, dynamic> json) => TopFilm(
      nameOriginal: json['nameOriginal'] as String?,
      nameRu: json['nameRu'] as String?,
      nameEn: json['nameEn'] as String?,
      posterUrl: json['posterUrl'] as String,
      year: (json['year'] as num).toInt(),
      kinopoiskId: (json['kinopoiskId'] as num).toInt(),
    );

Map<String, dynamic> _$TopFilmToJson(TopFilm instance) => <String, dynamic>{
      'nameOriginal': instance.nameOriginal,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'posterUrl': instance.posterUrl,
      'year': instance.year,
      'kinopoiskId': instance.kinopoiskId,
    };
