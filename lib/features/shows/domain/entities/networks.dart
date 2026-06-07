import 'package:equatable/equatable.dart';
import '../../data/models/networks.dart';


class NetworksEntity extends Equatable{

  final int id;
  final String ? name;
  final String ? logoPath;
  final String ? originCountry;

  const NetworksEntity({
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

  factory NetworksEntity.fromModels(NetworksModel model) {
    return NetworksEntity(
        id: model.id,
        name: model.name,
        logoPath: model.logoPath,
        originCountry: model.originCountry
    );
  }
}