import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/constants/constants.dart';
import 'package:sillicont_tv/features/shows/domain/entities/show_details.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_event.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';
import 'package:sillicont_tv/features/shows/presentation/widgets/show_horizontal_card.dart';
import 'package:sillicont_tv/l10/app_localizations.dart';

import '../widgets/show_vertical_card.dart';

class ShowDetails extends StatelessWidget {

  final ShowDetailsEntity _showDetailsEntity;
  final bool searchOnline;

  const ShowDetails({
    super.key,
    required this._showDetailsEntity,
    required this.searchOnline
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (popped, result) {
          if (popped) {
            context.read<ShowBloc>().add(ReloadShowList());
          }
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context, searchOnline),
        )
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)
      ),
      title: Text(
        _showDetailsEntity.name!,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool searchOnline) {
    final List<Widget> bodyWidgets = [];

    bodyWidgets.add(_buildHeader(context, searchOnline));

    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
      child: Card(
        child: Column(
          children: [
            Text(
                "${AppLocalizations.of(context)!.seasons}: ${_showDetailsEntity.numberOfSeasons}",
                style: Theme.of(context).textTheme.titleMedium
            ),
            Text(
                "${AppLocalizations.of(context)!.episodes}: ${_showDetailsEntity.numberOfEpisodes}",
                style: Theme.of(context).textTheme.titleMedium
            ),
            Text(
                "${AppLocalizations.of(context)!.seasons}: ${_showDetailsEntity.status}",
                style: Theme.of(context).textTheme.titleMedium
            ),
            if (_showDetailsEntity.adult != null)
              if (_showDetailsEntity.adult!)
                Text(AppLocalizations.of(context)!.adult, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    ));

    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
      child: Text(
        AppLocalizations.of(context)!.overview,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    ));

    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Text(
        _showDetailsEntity.overview!,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.justify,
      ),
    ));

    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
      child: Text(
        AppLocalizations.of(context)!.createdBy,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    ));

    bodyWidgets.add(_buildCreatedBy());

    
    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
      child: Text(
        AppLocalizations.of(context)!.lastEpisode,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    ));

    bodyWidgets.add(
      _buildShowVerticalCard(
          path: _showDetailsEntity.lastEpisodeToAir!.stillPath,
          title: _showDetailsEntity.lastEpisodeToAir!.name!,
          searchOnline: searchOnline,
          subtitle: "Aired in ${_showDetailsEntity.lastEpisodeToAir!.airDate!}",
          voteAverage: _showDetailsEntity.lastEpisodeToAir!.voteAverage!,
          textList: [
            '${AppLocalizations.of(context)!.season} ${_showDetailsEntity.lastEpisodeToAir!.seasonNumber}',
            '${AppLocalizations.of(context)!.episode} ${_showDetailsEntity.lastEpisodeToAir!.episodeNumber}']
      )
    );

    bodyWidgets.add(Padding(
      padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
      child: Text(
        AppLocalizations.of(context)!.seasons,
        style: Theme.of(context).textTheme.headlineSmall,
        overflow: TextOverflow.ellipsis,
      ),
    ));


    bodyWidgets.add(_buildSeasons());

    return ListView.builder(
        itemCount: bodyWidgets.length,
        itemBuilder: (context, idx) => bodyWidgets[idx]
    );
  }

  Widget _buildHeader(BuildContext context, bool searchOnline) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 30, horizontal: 10),
          child: ShowHorizontalCard(
            searchOnline: searchOnline,
            id: _showDetailsEntity.id,
            imgPath: tmdbImgSmallBaseURL + _showDetailsEntity.posterPath!,
            title: _showDetailsEntity.name!,
            subtitle: _showDetailsEntity.firstAirDate!,
            voteAverage: _showDetailsEntity.voteAverage!,
            textList: _showDetailsEntity.genres!.map((g) => g.name).toList(),
            onTap: (_) {},
          ),
        ),
      )
    );
  }

  Widget _buildCreatedBy() {
    if (_showDetailsEntity.createdBy!.length > 1) {
      return SizedBox(
          height: 425,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _showDetailsEntity.createdBy!.length,
              itemBuilder: (context, idx) {
                return _buildShowVerticalCard(
                    path: _showDetailsEntity.createdBy![idx].profilePath,
                    title: _showDetailsEntity.createdBy![idx].name!,
                    searchOnline: searchOnline
                );
              }
          )
      );
    }

    return Padding(
        padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
        child: _buildShowVerticalCard(
            path: _showDetailsEntity.createdBy![0].profilePath,
            title: _showDetailsEntity.createdBy![0].name!,
            searchOnline: searchOnline
        )
    );
  }

  Widget _buildSeasons() {
    if (_showDetailsEntity.seasons!.length > 1) {
      return SizedBox(
          height: 425,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _showDetailsEntity.seasons!.length,
              itemBuilder: (context, idx) {
                var epCount = _showDetailsEntity.seasons![idx].episodeCount;
                epCount ??= 0;
                return _buildShowVerticalCard(
                  path: _showDetailsEntity.seasons![idx].posterPath,
                  title: _showDetailsEntity.seasons![idx].name!,
                  searchOnline: searchOnline,
                  subtitle: "${AppLocalizations.of(context)!.airedIn} ${_showDetailsEntity.seasons![idx].airDate}",
                  voteAverage: _showDetailsEntity.seasons![idx].voteAverage,
                  textList: [
                    '${AppLocalizations.of(context)!.season} ${_showDetailsEntity.seasons![idx].seasonNumber}',
                    '${AppLocalizations.of(context)!.episodes} $epCount'],
                );
              }
          )
      );
    }

    return Padding(
        padding: EdgeInsetsGeometry.fromLTRB(8, 5, 10, 10),
        child: _buildShowVerticalCard(
            path: _showDetailsEntity.createdBy![0].profilePath,
            title: _showDetailsEntity.createdBy![0].name!,
            searchOnline: searchOnline
        )
    );
  }

  Widget _buildShowVerticalCard({
    String ? path,
    required String title,
    String ? subtitle,
    double ? voteAverage,
    List<String> ? textList,
    required bool searchOnline,
  }
  ) {
    if (path != null) {
      return ShowVerticalCard(
        imgPath: tmdbImgSmallBaseURL + path,
        title: title,
        subtitle: subtitle,
        voteAverage: voteAverage,
        textList: textList,
        searchOnline: searchOnline,
      );
    }
    return ShowVerticalCard(
      imgPath: '',
      title: title,
      subtitle: subtitle,
      voteAverage: voteAverage,
      textList: textList,
      unknown: true,
      searchOnline: searchOnline,
    );
  }
}