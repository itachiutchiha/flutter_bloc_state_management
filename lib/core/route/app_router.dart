import 'package:flutter/material.dart';
import 'package:state_management_learn/core/route/app_routes.dart';
import 'package:state_management_learn/data/models/character_model.dart';
import 'package:state_management_learn/presentation/screens/charactere_details_screen.dart';
import 'package:state_management_learn/presentation/screens/charactere_screen.dart';

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const CharactereScreen());
      case AppRoutes.charactereDetails:
        final CharacterModel characterModel =
            settings.arguments as CharacterModel;
        return _buildRoute(CharacterDetailScreen(character: characterModel));
    }
  }

  static MaterialPageRoute _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
