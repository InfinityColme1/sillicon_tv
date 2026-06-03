
abstract class ShowEvent {
  const ShowEvent();
}

class GetPopularShows extends ShowEvent {
  const GetPopularShows();
}

class GetShowDetails extends ShowEvent {
  final int showId;
  const GetShowDetails({required this.showId});
}