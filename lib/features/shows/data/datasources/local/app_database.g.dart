// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ShowDao? _showDaoInstance;

  SeasonDao? _seasonDaoInstance;

  EpisodeDao? _episodeDaoInstance;

  GenreDao? _genreDaoInstance;

  CreatorsDao? _creatorsDaoInstance;

  ShowDetailsDao? _showDetailsDaoInstance;

  ShowCreatorsDao? _showCreatorsDaoInstance;

  ShowGenresDao? _showGenresDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ShowModels` (`id` INTEGER NOT NULL, `genreIds` TEXT NOT NULL, `backdropPath` TEXT, `firstAirDate` TEXT, `name` TEXT, `originCountry` TEXT, `originalLanguage` TEXT, `originalName` TEXT, `overview` TEXT, `popularity` REAL, `posterPath` TEXT, `voteAverage` REAL, `voteCount` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GenreModels` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `EpisodeModels` (`id` INTEGER NOT NULL, `name` TEXT, `overview` TEXT, `voteAverage` REAL, `airDate` TEXT, `episodeNumber` INTEGER, `seasonNumber` INTEGER, `stillPath` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SeasonModels` (`id` INTEGER NOT NULL, `showId` INTEGER NOT NULL, `airDate` TEXT, `episodeCount` INTEGER, `name` TEXT, `overview` TEXT, `posterPath` TEXT, `seasonNumber` INTEGER, `voteAverage` REAL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CreatorsModels` (`id` INTEGER NOT NULL, `name` TEXT, `profilePath` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ShowDetailsModels` (`id` INTEGER NOT NULL, `adult` INTEGER, `episodeRuntime` INTEGER, `homepage` TEXT, `inProduction` INTEGER, `lastAirDate` TEXT, `idLastEpisodeToAir` INTEGER, `numberOfEpisodes` INTEGER, `numberOfSeasons` INTEGER, `languages` TEXT, `status` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ShowCreators` (`showId` INTEGER NOT NULL, `creatorId` INTEGER NOT NULL, PRIMARY KEY (`showId`, `creatorId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ShowGenres` (`id` INTEGER NOT NULL, `showId` INTEGER NOT NULL, `genreId` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ShowDao get showDao {
    return _showDaoInstance ??= _$ShowDao(database, changeListener);
  }

  @override
  SeasonDao get seasonDao {
    return _seasonDaoInstance ??= _$SeasonDao(database, changeListener);
  }

  @override
  EpisodeDao get episodeDao {
    return _episodeDaoInstance ??= _$EpisodeDao(database, changeListener);
  }

  @override
  GenreDao get genreDao {
    return _genreDaoInstance ??= _$GenreDao(database, changeListener);
  }

  @override
  CreatorsDao get creatorsDao {
    return _creatorsDaoInstance ??= _$CreatorsDao(database, changeListener);
  }

  @override
  ShowDetailsDao get showDetailsDao {
    return _showDetailsDaoInstance ??=
        _$ShowDetailsDao(database, changeListener);
  }

  @override
  ShowCreatorsDao get showCreatorsDao {
    return _showCreatorsDaoInstance ??=
        _$ShowCreatorsDao(database, changeListener);
  }

  @override
  ShowGenresDao get showGenresDao {
    return _showGenresDaoInstance ??= _$ShowGenresDao(database, changeListener);
  }
}

class _$ShowDao extends ShowDao {
  _$ShowDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _showModelInsertionAdapter = InsertionAdapter(
            database,
            'ShowModels',
            (ShowModel item) => <String, Object?>{
                  'id': item.id,
                  'genreIds': _intListConverter.encode(item.genreIds),
                  'backdropPath': item.backdropPath,
                  'firstAirDate': item.firstAirDate,
                  'name': item.name,
                  'originCountry': _strListConverter.encode(item.originCountry),
                  'originalLanguage': item.originalLanguage,
                  'originalName': item.originalName,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShowModel> _showModelInsertionAdapter;

  @override
  Future<List<ShowModel>> getShows() async {
    return _queryAdapter.queryList('SELECT * FROM ShowModels',
        mapper: (Map<String, Object?> row) => ShowModel(
            id: row['id'] as int,
            genreIds: _intListConverter.decode(row['genreIds'] as String),
            backdropPath: row['backdropPath'] as String?,
            firstAirDate: row['firstAirDate'] as String?,
            name: row['name'] as String?,
            originCountry:
                _strListConverter.decode(row['originCountry'] as String?),
            originalLanguage: row['originalLanguage'] as String?,
            originalName: row['originalName'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            voteAverage: row['voteAverage'] as double?,
            voteCount: row['voteCount'] as int?));
  }

  @override
  Future<ShowModel?> getShowById(int id) async {
    return _queryAdapter.query('SELECT * FROM ShowModels WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ShowModel(
            id: row['id'] as int,
            genreIds: _intListConverter.decode(row['genreIds'] as String),
            backdropPath: row['backdropPath'] as String?,
            firstAirDate: row['firstAirDate'] as String?,
            name: row['name'] as String?,
            originCountry:
                _strListConverter.decode(row['originCountry'] as String?),
            originalLanguage: row['originalLanguage'] as String?,
            originalName: row['originalName'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            voteAverage: row['voteAverage'] as double?,
            voteCount: row['voteCount'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertShow(ShowModel show) async {
    await _showModelInsertionAdapter.insert(show, OnConflictStrategy.ignore);
  }
}

class _$SeasonDao extends SeasonDao {
  _$SeasonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _seasonModelInsertionAdapter = InsertionAdapter(
            database,
            'SeasonModels',
            (SeasonModel item) => <String, Object?>{
                  'id': item.id,
                  'showId': item.showId,
                  'airDate': item.airDate,
                  'episodeCount': item.episodeCount,
                  'name': item.name,
                  'overview': item.overview,
                  'posterPath': item.posterPath,
                  'seasonNumber': item.seasonNumber,
                  'voteAverage': item.voteAverage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SeasonModel> _seasonModelInsertionAdapter;

  @override
  Future<List<SeasonModel>> getSeasons() async {
    return _queryAdapter.queryList('SELECT * FROM SeasonModels',
        mapper: (Map<String, Object?> row) => SeasonModel(
            id: row['id'] as int,
            showId: row['showId'] as int,
            airDate: row['airDate'] as String?,
            episodeCount: row['episodeCount'] as int?,
            name: row['name'] as String?,
            overview: row['overview'] as String?,
            posterPath: row['posterPath'] as String?,
            seasonNumber: row['seasonNumber'] as int?,
            voteAverage: row['voteAverage'] as double?));
  }

  @override
  Future<List<SeasonModel>> getSeasonsByShowId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM SeasonModels WHERE showId = ?1',
        mapper: (Map<String, Object?> row) => SeasonModel(
            id: row['id'] as int,
            showId: row['showId'] as int,
            airDate: row['airDate'] as String?,
            episodeCount: row['episodeCount'] as int?,
            name: row['name'] as String?,
            overview: row['overview'] as String?,
            posterPath: row['posterPath'] as String?,
            seasonNumber: row['seasonNumber'] as int?,
            voteAverage: row['voteAverage'] as double?),
        arguments: [id]);
  }

  @override
  Future<void> insertSeason(SeasonModel season) async {
    await _seasonModelInsertionAdapter.insert(
        season, OnConflictStrategy.ignore);
  }
}

class _$EpisodeDao extends EpisodeDao {
  _$EpisodeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _episodeModelInsertionAdapter = InsertionAdapter(
            database,
            'EpisodeModels',
            (EpisodeModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'overview': item.overview,
                  'voteAverage': item.voteAverage,
                  'airDate': item.airDate,
                  'episodeNumber': item.episodeNumber,
                  'seasonNumber': item.seasonNumber,
                  'stillPath': item.stillPath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EpisodeModel> _episodeModelInsertionAdapter;

  @override
  Future<List<EpisodeModel>> getEpisodes() async {
    return _queryAdapter.queryList('SELECT * FROM EpisodeModels',
        mapper: (Map<String, Object?> row) => EpisodeModel(
            id: row['id'] as int,
            name: row['name'] as String?,
            overview: row['overview'] as String?,
            voteAverage: row['voteAverage'] as double?,
            airDate: row['airDate'] as String?,
            episodeNumber: row['episodeNumber'] as int?,
            seasonNumber: row['seasonNumber'] as int?,
            stillPath: row['stillPath'] as String?));
  }

  @override
  Future<EpisodeModel?> getEpisodeById(int id) async {
    return _queryAdapter.query('SELECT * FROM EpisodeModels WHERE id = ?1',
        mapper: (Map<String, Object?> row) => EpisodeModel(
            id: row['id'] as int,
            name: row['name'] as String?,
            overview: row['overview'] as String?,
            voteAverage: row['voteAverage'] as double?,
            airDate: row['airDate'] as String?,
            episodeNumber: row['episodeNumber'] as int?,
            seasonNumber: row['seasonNumber'] as int?,
            stillPath: row['stillPath'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertEpisode(EpisodeModel episode) async {
    await _episodeModelInsertionAdapter.insert(
        episode, OnConflictStrategy.ignore);
  }
}

class _$GenreDao extends GenreDao {
  _$GenreDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreModelInsertionAdapter = InsertionAdapter(
            database,
            'GenreModels',
            (GenreModel item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GenreModel> _genreModelInsertionAdapter;

  @override
  Future<List<GenreModel>> getGenres() async {
    return _queryAdapter.queryList('SELECT * FROM GenreModels',
        mapper: (Map<String, Object?> row) =>
            GenreModel(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<GenreModel?> getGenreById(int id) async {
    return _queryAdapter.query('SELECT * FROM GenreModels WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            GenreModel(id: row['id'] as int, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<int?> getGenreIdByName(String name) async {
    return _queryAdapter.query('SELECT id FROM GenreModels WHERE name = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [name]);
  }

  @override
  Future<void> insertGenre(GenreModel genre) async {
    await _genreModelInsertionAdapter.insert(genre, OnConflictStrategy.ignore);
  }
}

class _$CreatorsDao extends CreatorsDao {
  _$CreatorsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _creatorModelInsertionAdapter = InsertionAdapter(
            database,
            'CreatorsModels',
            (CreatorModel item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'profilePath': item.profilePath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CreatorModel> _creatorModelInsertionAdapter;

  @override
  Future<List<CreatorModel>> getCreators() async {
    return _queryAdapter.queryList('SELECT * FROM CreatorsModels',
        mapper: (Map<String, Object?> row) => CreatorModel(
            id: row['id'] as int,
            name: row['name'] as String?,
            profilePath: row['profilePath'] as String?));
  }

  @override
  Future<CreatorModel?> getCreatorById(int id) async {
    return _queryAdapter.query('SELECT * FROM CreatorsModels WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CreatorModel(
            id: row['id'] as int,
            name: row['name'] as String?,
            profilePath: row['profilePath'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertCreator(CreatorModel creator) async {
    await _creatorModelInsertionAdapter.insert(
        creator, OnConflictStrategy.ignore);
  }
}

class _$ShowDetailsDao extends ShowDetailsDao {
  _$ShowDetailsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _showDetailsModelInsertionAdapter = InsertionAdapter(
            database,
            'ShowDetailsModels',
            (ShowDetailsModel item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult == null ? null : (item.adult! ? 1 : 0),
                  'episodeRuntime': item.episodeRuntime,
                  'homepage': item.homepage,
                  'inProduction': item.inProduction == null
                      ? null
                      : (item.inProduction! ? 1 : 0),
                  'lastAirDate': item.lastAirDate,
                  'idLastEpisodeToAir': item.idLastEpisodeToAir,
                  'numberOfEpisodes': item.numberOfEpisodes,
                  'numberOfSeasons': item.numberOfSeasons,
                  'languages': _strListConverter.encode(item.languages),
                  'status': item.status
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShowDetailsModel> _showDetailsModelInsertionAdapter;

  @override
  Future<List<ShowDetailsModel>> getShowDetails() async {
    return _queryAdapter.queryList('SELECT * FROM ShowDetailsModels',
        mapper: (Map<String, Object?> row) => ShowDetailsModel(
            id: row['id'] as int,
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            episodeRuntime: row['episodeRuntime'] as int?,
            homepage: row['homepage'] as String?,
            inProduction: row['inProduction'] == null
                ? null
                : (row['inProduction'] as int) != 0,
            lastAirDate: row['lastAirDate'] as String?,
            idLastEpisodeToAir: row['idLastEpisodeToAir'] as int?,
            numberOfEpisodes: row['numberOfEpisodes'] as int?,
            numberOfSeasons: row['numberOfSeasons'] as int?,
            languages: _strListConverter.decode(row['languages'] as String?),
            status: row['status'] as String?));
  }

  @override
  Future<ShowDetailsModel?> getShowDetailsById(int id) async {
    return _queryAdapter.query('SELECT * FROM ShowDetailsModels WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ShowDetailsModel(
            id: row['id'] as int,
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            episodeRuntime: row['episodeRuntime'] as int?,
            homepage: row['homepage'] as String?,
            inProduction: row['inProduction'] == null
                ? null
                : (row['inProduction'] as int) != 0,
            lastAirDate: row['lastAirDate'] as String?,
            idLastEpisodeToAir: row['idLastEpisodeToAir'] as int?,
            numberOfEpisodes: row['numberOfEpisodes'] as int?,
            numberOfSeasons: row['numberOfSeasons'] as int?,
            languages: _strListConverter.decode(row['languages'] as String?),
            status: row['status'] as String?),
        arguments: [id]);
  }

  @override
  Future<ShowDetailsModel?> getFirstShow() async {
    return _queryAdapter.query('SELECT * FROM ShowDetailsModels LIMIT 1',
        mapper: (Map<String, Object?> row) => ShowDetailsModel(
            id: row['id'] as int,
            adult: row['adult'] == null ? null : (row['adult'] as int) != 0,
            episodeRuntime: row['episodeRuntime'] as int?,
            homepage: row['homepage'] as String?,
            inProduction: row['inProduction'] == null
                ? null
                : (row['inProduction'] as int) != 0,
            lastAirDate: row['lastAirDate'] as String?,
            idLastEpisodeToAir: row['idLastEpisodeToAir'] as int?,
            numberOfEpisodes: row['numberOfEpisodes'] as int?,
            numberOfSeasons: row['numberOfSeasons'] as int?,
            languages: _strListConverter.decode(row['languages'] as String?),
            status: row['status'] as String?));
  }

  @override
  Future<void> insertShowDetails(ShowDetailsModel showDetails) async {
    await _showDetailsModelInsertionAdapter.insert(
        showDetails, OnConflictStrategy.replace);
  }
}

class _$ShowCreatorsDao extends ShowCreatorsDao {
  _$ShowCreatorsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _showCreatorsModelInsertionAdapter = InsertionAdapter(
            database,
            'ShowCreators',
            (ShowCreatorsModel item) => <String, Object?>{
                  'showId': item.showId,
                  'creatorId': item.creatorId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShowCreatorsModel> _showCreatorsModelInsertionAdapter;

  @override
  Future<List<ShowCreatorsModel>> getShowCreators() async {
    return _queryAdapter.queryList('SELECT * FROM ShowCreators',
        mapper: (Map<String, Object?> row) => ShowCreatorsModel(
            showId: row['showId'] as int, creatorId: row['creatorId'] as int));
  }

  @override
  Future<List<ShowCreatorsModel>> getCreatorsByShowId(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ShowCreators WHERE showId = ?1',
        mapper: (Map<String, Object?> row) => ShowCreatorsModel(
            showId: row['showId'] as int, creatorId: row['creatorId'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertShowCreator(ShowCreatorsModel showCreator) async {
    await _showCreatorsModelInsertionAdapter.insert(
        showCreator, OnConflictStrategy.abort);
  }
}

class _$ShowGenresDao extends ShowGenresDao {
  _$ShowGenresDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _showGenresModelInsertionAdapter = InsertionAdapter(
            database,
            'ShowGenres',
            (ShowGenresModel item) => <String, Object?>{
                  'id': item.id,
                  'showId': item.showId,
                  'genreId': item.genreId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShowGenresModel> _showGenresModelInsertionAdapter;

  @override
  Future<List<ShowGenresModel>> getShowGenres() async {
    return _queryAdapter.queryList('SELECT * FROM ShowGenres',
        mapper: (Map<String, Object?> row) => ShowGenresModel(
            id: row['id'] as int,
            showId: row['showId'] as int,
            genreId: row['genreId'] as int));
  }

  @override
  Future<List<ShowGenresModel>> getGenresByShowId(int id) async {
    return _queryAdapter.queryList('SELECT * FROM ShowGenres WHERE showId = ?1',
        mapper: (Map<String, Object?> row) => ShowGenresModel(
            id: row['id'] as int,
            showId: row['showId'] as int,
            genreId: row['genreId'] as int),
        arguments: [id]);
  }

  @override
  Future<void> insertShowGenre(ShowGenresModel showGenre) async {
    await _showGenresModelInsertionAdapter.insert(
        showGenre, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _intListConverter = IntListConverter();
final _strListConverter = StrListConverter();
