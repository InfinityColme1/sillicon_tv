import 'package:floor/floor.dart';
import '../../domain/entities/companies.dart';


@Entity(tableName: 'CompaniesModel')
class CompaniesModel  {

  @primaryKey
  final int id;

  final String ? name;
  final String ? logoPath;
  final String ? originCountry;

  const CompaniesModel({
    required this.id,
    this.name,
    this.logoPath,
    this.originCountry
  });

  factory CompaniesModel.fromJson(Map<String, dynamic> map) {
    return CompaniesModel(
      id: map['id'],
      name: map['name'],
      logoPath: map['profile_path'],
      originCountry: map['origin_country']
    );
  }

  factory CompaniesModel.fromEntity(CompaniesEntity entt) {
    return CompaniesModel(
        id: entt.id,
        name: entt.name,
        logoPath: entt.logoPath,
        originCountry: entt.originCountry
    );
  }
}