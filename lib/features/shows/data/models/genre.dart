import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';


class GenreModel extends GenreEntity {

  const GenreModel({
    required super.id,
    required super.name
  });

  factory GenreModel.fromJson(Map<String, dynamic> map) {
    return GenreModel(
        id: map['id'],
        name: map['name']
    );
  }
}