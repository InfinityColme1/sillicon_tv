
import 'package:flutter/material.dart';
import 'package:sillicont_tv/core/constants/constants.dart';

abstract class ShowEvent {
  const ShowEvent();
}

class GetPopularShows extends ShowEvent {
  final String language;
  final bool searchOnline;

  const GetPopularShows({
    required this.searchOnline,
    this.language = english
  });
}

class GetShowDetails extends ShowEvent {
  final int showId;
  final bool searchOnline;
  const GetShowDetails({required this.showId, required this.searchOnline});
}

class ReloadShowList extends ShowEvent {
  const ReloadShowList();
}

class ChangeSearchMode extends ShowEvent {
  const ChangeSearchMode();
}

class ChangeTheme extends ShowEvent {
  const ChangeTheme();
}

class ChangeLanguage extends ShowEvent {
  const ChangeLanguage();
}