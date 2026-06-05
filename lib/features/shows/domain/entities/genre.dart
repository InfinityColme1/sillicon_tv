import 'package:equatable/equatable.dart';
import 'package:sillicont_tv/features/shows/data/models/genre.dart';

class GenreEntity extends Equatable {
  final int id;
  final String name;

  const GenreEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  factory GenreEntity.fromModel(GenreModel model) {
    return GenreEntity(id: model.id, name: model.name);
  }

}