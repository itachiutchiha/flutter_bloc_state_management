import 'package:flutter/material.dart';
import 'package:state_management_learn/core/route/app_routes.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/presentation/screens/charactere_details_screen.dart';
import 'package:state_management_learn/features/character/presentation/screens/charactere_screen.dart';
import 'package:state_management_learn/features/seach/presentation/screens/search_screen.dart';
import 'package:state_management_learn/main_home_page_screen.dart';

abstract class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _buildRoute(const MainHomePage());
      case AppRoutes.characterSecreen:
        return _buildRoute(CharactereScreen());
      case AppRoutes.charactereDetailsScreen:
        final CharacterModel characterModel =
            settings.arguments as CharacterModel;
        return _buildRoute(CharacterDetailScreen(character: characterModel));
      case AppRoutes.searchScreen:
        return _buildRoute(SearchScreen());
    }
  }

  static MaterialPageRoute _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
