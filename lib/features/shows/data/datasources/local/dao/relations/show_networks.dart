import 'package:floor/floor.dart';

import '../../../../models/relations/show_network.dart';


@dao
abstract class ShowNetworksDao {

  @insert
  Future<void> insertShowNetwork(ShowNetworkModel showCreator);

  @Query('SELECT * FROM ShowNetworkModel')
  Future<List<ShowNetworkModel>> getShowNetwork();

  @Query('SELECT * FROM ShowNetworkModel WHERE showId = :id')
  Future<List<ShowNetworkModel>> getNetworkByShowId(int id);
}