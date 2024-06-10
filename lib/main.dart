import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/core/bloc/bloc_observer.dart';
import 'package:pokemon_challenge/core/di_core.dart';
import 'package:pokemon_challenge/presentation/home/home_page.dart';

import 'presentation/home/bloc/pokemon_bloc.dart';

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  setupDiCore();
  Bloc.observer = const AppBlocObserver();
  ChuckerFlutter.showNotification = false;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc(
            repository: getIt(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
      ),
    );
  }
}
