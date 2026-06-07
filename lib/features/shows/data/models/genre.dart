import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/domain/entities/genre.dart';


@Entity(tableName: 'GenreModels')
class GenreModel {

  @primaryKey
  final int id;
  final String name;

  const GenreModel({
    required this.id,
    required this.name
  });

  factory GenreModel.fromJson(Map<String, dynamic> map) {
    return GenreModel(
        id: map['id'],
        name: map['name']
    );
  }

  factory GenreModel.fromEntity(GenreEntity entt) {
    return GenreModel(
      id: entt.id,
      name: entt.name
    );
  }
}