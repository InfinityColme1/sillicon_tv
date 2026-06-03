import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class ShowVerticalCard extends StatelessWidget {

  final String imgPath;
  final String title;
  final String ? subtitle;
  final double ? voteAverage;
  final List<String> ?  textList;

  final bool unknown;

  const ShowVerticalCard({
    super.key,
    required this.imgPath,
    required this.title,
    this.subtitle,
    this.voteAverage,
    this.textList,
    this.unknown = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              unknown
              ? Image.asset(
                unknownImg,
                height: 300,
                fit: BoxFit.cover,
              ) :
              Image.network(
                imgPath,
                height: 300,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : LinearProgressIndicator();
                },
              ),


              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                    ),

                    if (subtitle != null && voteAverage != null)
                    Row(
                      children: [
                        Text(
                          subtitle!,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.clip,
                          softWrap: false,
                        ),
                        Row(children: [
                          Icon(Icons.star),
                          Text(
                            voteAverage.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                          )
                        ]),
                      ],
                    ),

                    if (textList != null && textList!.isNotEmpty)
                      Text(
                        textList!.join(' '),
                        style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                      )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }


}