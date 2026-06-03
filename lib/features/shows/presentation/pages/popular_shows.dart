import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/constants/constants.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';
import 'package:sillicont_tv/features/shows/presentation/pages/show_details.dart';
import 'package:sillicont_tv/features/shows/presentation/widgets/show_horizontal_card.dart';

import '../bloc/show_event.dart';

class PopularShows extends StatelessWidget {
  const PopularShows({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppbar(BuildContext context){
    return AppBar(
      title: Text(
        "SilliconTV",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildBody() {
    return BlocListener<ShowBloc, ShowState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is ShowDetailsSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ShowDetails(
                  showDetailsEntity: state.showDetails!
              ))
          );
        }
      },
      child: BlocBuilder<ShowBloc, ShowState>(
          builder: (context, state) {

            if (state is ShowLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ShowException) {
              return const Center(child: Icon(Icons.refresh));
            }

            if (state is ShowSuccess) {
              final List<Widget> bodyWidgets = [];

              bodyWidgets.add(
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 5),
                    child: Text(
                      "Popular right now",
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
                      subtitle: "First aired in ${show.firstAirDate!}",
                      voteAverage: show.voteAverage!,
                      textList: show.genreNames!,
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
                    itemCount: state.showList!.length,
                    itemBuilder: (context, idx) {
                      return bodyWidgets[idx];
                    }
                ),
              );
            }

            return const SizedBox();
          }),
    );
  }
}