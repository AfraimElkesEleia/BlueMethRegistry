import 'package:blue_meth_registery/constants/routes.dart';
import 'package:blue_meth_registery/core/business_logic/characters_cubit.dart';
import 'package:blue_meth_registery/core/data/models/character.dart';
import 'package:blue_meth_registery/core/data/web_services/character_web_service.dart';
import 'package:blue_meth_registery/core/presentation/screens/character_details_screen.dart';
import 'package:blue_meth_registery/core/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'core/data/repository/caharacter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late final CharactersRepository charactersRepository;
  late final CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (BuildContext context) =>
                       charactersCubit,
                child: Homescreen(),
              ),
        );
      case AppRoutes.characterDetailsScreenRoute:
        final Character character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );
    }
  }
}
