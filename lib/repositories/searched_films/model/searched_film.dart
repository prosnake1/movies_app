import 'package:json_annotation/json_annotation.dart';

part 'searched_film.g.dart';

@JsonSerializable()
class SearchedFilm {
  SearchedFilm(
      {required this.nameOriginal,
      required this.nameRu,
      required this.nameEn,
      required this.year,
      required this.posterUrl,
      required this.filmId});
  final String? nameOriginal;
  final String? nameRu;
  final String? nameEn;
  final String year;
  final String posterUrl;
  final int filmId;
  factory SearchedFilm.fromJson(Map<String, dynamic> json) =>
      _$SearchedFilmFromJson(json);

  Map<String, dynamic> toJson() => _$SearchedFilmToJson(this);
}
