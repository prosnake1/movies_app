import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_film.g.dart';

@JsonSerializable()
class TopFilm extends Equatable {
  const TopFilm(
      {required this.nameOriginal,
      required this.nameRu,
      required this.nameEn,
      required this.posterUrl,
      required this.year,
      required this.kinopoiskId});
  final String? nameOriginal;
  final String? nameRu;
  final String? nameEn;
  final String posterUrl;
  final int year;
  final int kinopoiskId;

  factory TopFilm.fromJson(Map<String, dynamic> json) =>
      _$TopFilmFromJson(json);

  Map<String, dynamic> toJson() => _$TopFilmToJson(this);

  @override
  List<Object?> get props => [
        nameOriginal,
        nameRu,
        nameEn,
        posterUrl,
        year,
        kinopoiskId,
      ];
}
