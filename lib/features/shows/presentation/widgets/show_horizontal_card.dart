import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/show_event.dart';

class ShowHorizontalCard extends StatelessWidget {

  final int id;
  final String imgPath;
  final String title;
  final String subtitle;
  final double voteAverage;
  final List<String> textList;
  final bool searchOnline;
  final Function(ShowEvent event) onTap;

  const ShowHorizontalCard({
    super.key,
    required this.id,
    required this.imgPath,
    required this.title,
    required this.subtitle,
    required this.voteAverage,
    required this.textList,
    required this.searchOnline,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      child: Card(
        child: InkWell(
          onTap: () => onTap(GetShowDetails(showId: id, searchOnline: searchOnline)),
          child: Row(
            children: [

              searchOnline
              ? Image.network(
                  imgPath,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : SizedBox(
                            width: 100,
                            height: 150,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                  },
                )
              : Image.asset(
                unknownImg,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),

              SizedBox(width: 10),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( title, style: Theme.of(context).textTheme.titleLarge,),
                      Text(subtitle),
                      SizedBox(height: 15),
                      Row(children: [Icon(Icons.star), Text(voteAverage.toString())]),
                      if (textList.isNotEmpty)
                        Text(textList.join(' '), overflow: TextOverflow.clip,)
                    ],
                  )
              )
            ],
          ),
        )
      )
    );
  }

}