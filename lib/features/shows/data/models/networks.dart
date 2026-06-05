import 'package:floor/floor.dart';
import '../../domain/entities/companies.dart';
import '../../domain/entities/networks.dart';


@Entity(tableName: 'NetworksModel')
class NetworksModel  {

  @primaryKey
  final int id;

  final String ? name;
  final String ? logoPath;
  final String ? originCountry;

  const NetworksModel({
    required this.id,
    this.name,
    this.logoPath,
    this.originCountry
  });

  factory NetworksModel.fromJson(Map<String, dynamic> map) {
    return NetworksModel(
        id: map['id'],
        name: map['name'],
        logoPath: map['profile_path'],
        originCountry: map['origin_country']
    );
  }

  factory NetworksModel.fromEntity(NetworksEntity entt) {
    return NetworksModel(
        id: entt.id,
        name: entt.name,
        logoPath: entt.logoPath,
        originCountry: entt.originCountry
    );
  }
}