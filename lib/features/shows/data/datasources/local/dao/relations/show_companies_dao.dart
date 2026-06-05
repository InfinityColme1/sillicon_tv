import 'package:floor/floor.dart';
import '../../../../models/relations/show_companies.dart';


@dao
abstract class ShowCompaniesDao {

  @insert
  Future<void> insertShowCompany(ShowCompaniesModel showCreator);

  @Query('SELECT * FROM ShowCompanyModel')
  Future<List<ShowCompaniesModel>> getShowCompany();

  @Query('SELECT * FROM ShowCompanyModel WHERE showId = :id')
  Future<List<ShowCompaniesModel>> getCompaniesByShowId(int id);
}