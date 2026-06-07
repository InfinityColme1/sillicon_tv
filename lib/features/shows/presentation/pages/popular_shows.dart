import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/core/constants/constants.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';
import 'package:sillicont_tv/features/shows/presentation/widgets/showlist_item.dart';

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
    return BlocBuilder<ShowBloc, ShowState>(
        builder: (context, state) {

          if (state is ShowLoading) {
            return CircularProgressIndicator();
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
                  ShowlistItem(
                    context: context,
                    imgPath: tmdbImgSmallBaseURL + show.posterPath!,
                    showName: show.name!,
                    airDate: show.firstAirDate!,
                    popularity: show.popularity!,
                    genres: show.genreNames!,
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
        });
  }
}