import 'package:floor/floor.dart';

@Entity(tableName: 'ShowNetworkModel', primaryKeys: ['showId', 'networkId'])
class ShowNetworkModel {

  final int showId;
  final int networkId;

  ShowNetworkModel({
    required  this.showId,
    required this.networkId
  });
}