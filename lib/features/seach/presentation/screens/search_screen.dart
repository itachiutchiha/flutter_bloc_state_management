import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/core/constants/app_colors.dart';
import 'package:state_management_learn/core/route/app_routes.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/presentation/controller/cubit/character_cubit.dart';
import 'package:state_management_learn/features/character/presentation/screens/charactere_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CharacterModel> characters = [];
  final TextEditingController _searchController = TextEditingController();
  List<CharacterModel> filtredCharacters = [];

  void filterList() {
    if (_searchController.text.isNotEmpty) {
      if (characters.isEmpty) {
        final cubitState = context.read<CharacterCubit>().state;
        if (cubitState is CharacterSuccesState)
          characters = cubitState.characters;
      }
      filtredCharacters = characters
          .where((element) => element.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    } else {
      filtredCharacters = [];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  filterList();
                },
                cursorColor: Colors.white,
                cursorWidth: 1.5,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.myYellow, width: 1.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.myYellow, width: 1.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filtredCharacters.isEmpty
                    ? Center(
                        child: Text("Search For Characters"),
                      )
                    : GridView.builder(
                        itemCount: filtredCharacters.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              0.58, // Tall aspect ratio to fit image + text info
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRoutes.charactereDetailsScreen,
                                arguments: filtredCharacters[index]),
                            child: CharacterCard(
                                character: filtredCharacters[index]),
                          );
                        },
                      ),
              )
            ],
          ),
        ));
  }
}
