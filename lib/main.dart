import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sillicont_tv/config/theme/app_theme.dart';
import 'package:sillicont_tv/core/service_locator.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_event.dart';
import 'package:sillicont_tv/features/shows/presentation/pages/popular_shows.dart';

Future<void> main() async {
  await dotenv.load();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowBloc>(
      create: (context) => getIt()..add(const GetPopularShows()),
      child: MaterialApp(
        title: 'SilliconTV',
        theme: AppTheme.lightTheme,
        home: const PopularShows(),
      ),
    );
  }
}
