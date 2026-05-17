import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/core/route/app_router.dart';
import 'package:state_management_learn/data/data_source/remote_data_source.dart';
import 'package:state_management_learn/data/repository/character_repository_impl.dart';
import 'package:state_management_learn/presentation/controller/cubit/character_cubit.dart';
import 'package:state_management_learn/presentation/screens/charactere_screen.dart';

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
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: BlocProvider(
        create: (context) => CharacterCubit(
            CharacterRepositoryImpl(remoteDataSource: RemoteDataSource()))
          ..getCharacters(),
        lazy: false,
        child: const CharactereScreen(),
      ),
    );
  }
}
