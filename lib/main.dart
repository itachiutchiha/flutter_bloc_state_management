import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/core/route/app_router.dart';
import 'package:state_management_learn/main_home_page_screen.dart';

import 'features/character/data/data_source/remote_data_source.dart';
import 'features/character/data/repository/character_repository_impl.dart';
import 'features/character/presentation/controller/cubit/character_cubit.dart';
import 'features/character/presentation/screens/charactere_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        scaffoldBackgroundColor: const Color(0xFF121214),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF121214),
        ),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: BlocProvider(
        create: (context) => CharacterCubit(
            CharacterRepositoryImpl(remoteDataSource: RemoteDataSource()))
          ..getCharacters(),
        lazy: false,
        child: const MainHomePage(),
      ),
    );
  }
}
