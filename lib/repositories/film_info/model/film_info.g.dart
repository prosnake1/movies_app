// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmInfo _$FilmInfoFromJson(Map<String, dynamic> json) => FilmInfo(
      kinopoiskId: (json['kinopoiskId'] as num).toInt(),
      nameRu: json['nameRu'] as String?,
      nameOriginal: json['nameOriginal'] as String?,
      nameEn: json['nameEn'] as String?,
      posterUrl: json['posterUrl'] as String,
      year: (json['year'] as num).toInt(),
      description: json['description'] as String?,
      countries: json['countries'] as List<dynamic>?,
      genres: json['genres'] as List<dynamic>?,
    );

Map<String, dynamic> _$FilmInfoToJson(FilmInfo instance) => <String, dynamic>{
      'kinopoiskId': instance.kinopoiskId,
      'nameRu': instance.nameRu,
      'nameOriginal': instance.nameOriginal,
      'nameEn': instance.nameEn,
      'posterUrl': instance.posterUrl,
      'year': instance.year,
      'description': instance.description,
      'countries': instance.countries,
      'genres': instance.genres,
    };
