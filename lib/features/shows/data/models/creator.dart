import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/domain/entities/creator.dart';

@Entity(tableName: 'CreatorsModels')
class CreatorModel  {

  @primaryKey
  final int id;

  final String ? name;
  final String ? profilePath;

  const CreatorModel({
    required this.id,
    this.name,
    this.profilePath
  });

  factory CreatorModel.fromJson(Map<String, dynamic> map) {
    return CreatorModel(
        id: map['id'],
        name: map['name'],
        profilePath: map['profile_path']
    );
  }

  factory CreatorModel.fromEntity(CreatorEntity entt) {
    return CreatorModel(
      id: entt.id,
      name: entt.name,
      profilePath: entt.profilePath
    );
  }
}