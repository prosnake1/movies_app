import 'package:json_annotation/json_annotation.dart';

part 'film_info.g.dart';

@JsonSerializable()
class FilmInfo {
  FilmInfo({
    required this.kinopoiskId,
    required this.nameRu,
    required this.nameOriginal,
    required this.nameEn,
    required this.posterUrl,
    required this.year,
    required this.description,
    required this.countries,
    required this.genres,
  });
  final int kinopoiskId;
  final String? nameRu;
  final String? nameOriginal;
  final String? nameEn;
  final String posterUrl;
  final int year;
  final String? description;
  final List? countries;
  final List? genres;
  factory FilmInfo.fromJson(Map<String, dynamic> json) =>
      _$FilmInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FilmInfoToJson(this);
}
