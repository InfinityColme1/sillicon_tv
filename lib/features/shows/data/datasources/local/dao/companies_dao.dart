import 'package:floor/floor.dart';
import 'package:sillicont_tv/features/shows/data/models/companies.dart';


@dao
abstract class CompaniesDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertCompany(CompaniesModel company);

  @Query('SELECT * FROM CompaniesModel')
  Future<List<CompaniesModel>> getCompanies();

  @Query('SELECT * FROM CompaniesModel WHERE id = :id')
  Future<CompaniesModel?> getCompanyById(int id);
}