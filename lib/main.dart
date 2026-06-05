import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sillicont_tv/l10/app_localizations.dart';
import 'package:sillicont_tv/l10/l10.dart';
import 'package:sillicont_tv/config/theme/app_theme.dart';
import 'package:sillicont_tv/core/service_locator.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_bloc.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_event.dart';
import 'package:sillicont_tv/features/shows/presentation/bloc/show_state.dart';
import 'package:sillicont_tv/features/shows/presentation/pages/popular_shows.dart';

import 'core/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      create: (context) => getIt()..add(const GetPopularShows(searchOnline: true)),
      child: BlocBuilder<ShowBloc, ShowState>(
          builder: (context, state) {
            return MaterialApp(
              title: appTitle,

              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,


              locale: Locale(state.lang),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,

              home: const PopularShows(),
            );
          }
      ),
    );
  }
}
