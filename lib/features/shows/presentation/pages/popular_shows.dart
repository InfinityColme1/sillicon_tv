import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/constants/constants.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';
import 'package:sillicont_tv/features/shows/presentation/pages/show_details.dart';
import 'package:sillicont_tv/features/shows/presentation/widgets/show_horizontal_card.dart';
import 'package:sillicont_tv/l10/app_localizations.dart';

import '../../../../config/theme/app_colors.dart';
import '../bloc/show_event.dart';

class PopularShows extends StatefulWidget {
  const PopularShows({super.key});

  @override
  State<PopularShows> createState() => _PopularShows();
}

class _PopularShows extends State<PopularShows> {

  bool searchOnline = true;
  ThemeMode themeMode = ThemeMode.light;
  String language = english;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
     if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
       context.read<ShowBloc>().add(GetMoreShows());
     }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShowBloc, ShowState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {

        language = state.lang;
        themeMode = state.themeMode;

        if (state is ShowException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.error,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.terciary
                  ),
                )
            )
          );
        }

        if (state is ShowSuccess) {
          setState(() {
            searchOnline = state.searchOnline;
          });
        }

        if (state is ShowDetailsSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ShowDetails(
                  showDetailsEntity: state.showDetails!,
                  searchOnline: searchOnline
              ))
          );
        }
      },
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context){
    return AppBar(
      title: Text(
        appTitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        IconButton(
            onPressed: (){
              context.read<ShowBloc>().add(ChangeSearchMode());
            },
            icon: Icon(searchOnline ? Icons.wifi : Icons.wifi_off)
        ),

        IconButton(
            onPressed: (){
              context.read<ShowBloc>().add(ChangeTheme());
            },
            icon: Icon((themeMode == ThemeMode.light) ?
            Icons.brightness_7 : Icons.brightness_5_sharp)
        ),


        TextButton(
            onPressed: () {
              context.read<ShowBloc>().add(ChangeLanguage());
            },
            child: Text(
              language.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            )
        )
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ShowBloc, ShowState>(
      builder: (context, state) {

        if (state is ShowLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ShowSuccess || state is ShowException) {
          final bool searchOnline = state.searchOnline;
          final List<Widget> bodyWidgets = [];

          bodyWidgets.add(
              Padding(
                padding: EdgeInsetsGeometry.only(top: 5),
                child: Text(
                  AppLocalizations.of(context)!.popular,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
          );

          for (var show in state.showList!) {
            bodyWidgets.add(
                ShowHorizontalCard(
                  id: show.id!,
                  imgPath: tmdbImgSmallBaseURL + show.posterPath!,
                  title: show.name!,
                  subtitle: '${AppLocalizations.of(context)!.firstAired} ${show.firstAirDate!}',
                  voteAverage: show.voteAverage!,
                  textList: show.genres!.map((g) => g.name).toList(),
                  searchOnline: searchOnline,
                  onTap: (ShowEvent event) {
                    context.read<ShowBloc>()
                        .add(event);
                  },
                )
            );
          }

          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: state.showList!.length,
                itemBuilder: (context, idx) {
                  return bodyWidgets[idx];
                }
            ),
          );
        }

        return const SizedBox();
      });
  }
}