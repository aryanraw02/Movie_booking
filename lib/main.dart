/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-14 15:42:03
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:cinema_booking/common/bloc/theme/theme_cubit.dart';
import 'package:cinema_booking/core/configs/theme/app_theme.dart';
import 'package:cinema_booking/firebase_options.dart';
import 'package:cinema_booking/presentation/home/bloc/home_bloc.dart';
import 'package:cinema_booking/presentation/router.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:cinema_booking/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // Ensure Flutter is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize HydratedBloc for state persistence
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize app dependencies (e.g., get it, ...)
  await initializeDependencies();

  // Custom log bloc observer
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (context) => AuthenticationBloc()..add(AppStarted())),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder:
            (context, mode) => BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Cinema Booking',
                  theme: AppTheme.lightTheme,
                  darkTheme: AppTheme.darkTheme,
                  themeMode: mode,
                  routerConfig: appRouter,
                );
              },
            ),
      ),
    );
  }
}
