import 'package:floor/floor.dart';


@Entity(tableName: 'ShowCompaniesModel', primaryKeys: ['showId', 'companyId'])
class ShowCompaniesModel {

  final int showId;
  final int companyId;

  ShowCompaniesModel({
    required  this.showId,
    required this.companyId
  });
}