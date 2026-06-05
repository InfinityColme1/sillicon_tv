import 'package:equatable/equatable.dart';
import '../../data/models/companies.dart';


class CompaniesEntity extends Equatable {

  final int id;
  final String ? name;
  final String ? logoPath;
  final String ? originCountry;

  const CompaniesEntity({
    required this.id,
    this.name,
    this.logoPath,
    this.originCountry
  });

  @override
  List<Object?> get props => [
    id,
    name,
    logoPath,
    originCountry
  ];


  factory CompaniesEntity.fromModels(CompaniesModel model) {
    return CompaniesEntity(
        id: model.id,
        name: model.name,
        logoPath: model.logoPath,
        originCountry: model.originCountry
    );
  }
}