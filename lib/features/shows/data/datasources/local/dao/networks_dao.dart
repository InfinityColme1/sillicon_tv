import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/networks.dart';


@dao
abstract class NetworksDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertNetwork(NetworksModel network);

  @Query('SELECT * FROM NetworksModel')
  Future<List<NetworksModel>> getNetworks();

  @Query('SELECT * FROM NetworksModel WHERE id = :id')
  Future<NetworksModel?> getNetworkById(int id);
}