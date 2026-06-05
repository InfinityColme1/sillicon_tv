import 'package:floor/floor.dart';
import '../creator.dart';
import '../show_details.dart';


@Entity(tableName: 'ShowCreators', primaryKeys: ['showId', 'creatorId'])
class ShowCreatorsModel {

  final int showId;
  final int creatorId;

  ShowCreatorsModel({
    required  this.showId,
    required this.creatorId
  });
}