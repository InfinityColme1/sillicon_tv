import 'package:flutter/material.dart';

class ShowlistItem extends StatelessWidget {

  final BuildContext context;
  final String imgPath;
  final String showName;
  final String airDate;
  final double popularity;
  final List<String> genres;

  const ShowlistItem({
    super.key,
    required this.context,
    required this.imgPath,
    required this.showName,
    required this.airDate,
    required this.popularity,
    required this.genres
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 10),
      child: Card(
        child: Row(
          children: [

            Image.network(
              imgPath,
              width: 100,
              height: 150,
              fit: BoxFit.fill,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : LinearProgressIndicator();
              },
            ),

            SizedBox(width: 10),

            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( showName, style: Theme.of(context).textTheme.titleLarge,),
                    Text("First aired in: $airDate"),
                    SizedBox(height: 15),
                    Row(children: [Icon(Icons.star), Text(popularity.toString())]),
                    Text("Genres: ${genres.join(',')}", overflow: TextOverflow.clip,)
                  ],
                )
            )
          ],
        ),
      )
    );
  }

}