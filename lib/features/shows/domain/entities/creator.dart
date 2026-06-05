import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/creator.dart';


class CreatorEntity extends Equatable {
  final int id;
  final String ? name;
  final String ? profilePath;

  const CreatorEntity({required this.id, this.name, this.profilePath});

  @override
  List<Object?> get props => [name, profilePath];

  factory CreatorEntity.fromModel(CreatorModel model) {
    return CreatorEntity(
      id: model.id,
      name: model.name,
      profilePath: model.profilePath
    );
  }
}