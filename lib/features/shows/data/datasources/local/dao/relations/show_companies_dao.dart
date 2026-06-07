import 'package:floor/floor.dart';
import '../../../../models/relations/show_companies.dart';


@dao
abstract class ShowCompaniesDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertShowCompany(ShowCompaniesModel showCreator);

  @Query('SELECT * FROM ShowCompaniesModel')
  Future<List<ShowCompaniesModel>> getShowCompany();

  @Query('SELECT * FROM ShowCompaniesModel WHERE showId = :id')
  Future<List<ShowCompaniesModel>> getCompaniesByShowId(int id);
}