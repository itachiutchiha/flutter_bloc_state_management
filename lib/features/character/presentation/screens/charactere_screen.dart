// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/core/route/app_routes.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';
import 'package:state_management_learn/features/character/presentation/controller/cubit/character_cubit.dart';

class CharactereScreen extends StatelessWidget {
  const CharactereScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CharacterFailureState) {
          return Center(child: Text(state.error));
        } else if (state is CharacterSuccesState) {
          return Scaffold(
            backgroundColor: const Color(0xFF121214), // Modern dark background
            appBar: AppBar(
              title: const Text(
                'Cast & Characters',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: const Color(0xFF1A1A1E),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: state.characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        arguments: state.characters[index]),
                    child: CharacterCard(character: state.characters[index]),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  final CharacterModel character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("character -> ${character.name}");
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1E), // Slightly lighter than background
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Character Image with Series Tag Overlay
          Expanded(
            flex: 11,
            child: Stack(
              children: [
                Image.network(
                  character.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  // Fallback loading mechanism if network fails
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.person,
                        color: Colors.white54, size: 50),
                  ),
                ),
                // Series Tag Overlay
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      character.serieName,
                      style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Character Details
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Names
                  Text(
                    character.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    character.fullName,
                    style: TextStyle(color: Colors.grey[400], fontSize: 11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),

                  // Episodes count and Birthday row
                  Row(
                    children: [
                      const Icon(Icons.movie_filter_outlined, size: 12),
                      const SizedBox(width: 4),
                      Text('${character.episodesCount} Eps'),
                      const Spacer(),
                      const Icon(Icons.cake_outlined, size: 12),
                      const SizedBox(width: 4),
                      // Wrap text in Flexible or Expanded to force it to respect constraints
                      Flexible(
                        child: Text(
                          character.birthday,
                          maxLines: 1,
                          overflow: TextOverflow
                              .ellipsis, // Adds "..." if it's too long
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white10, height: 12),

                  // Jobs / Occupations Tag Cloud
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: character.jobs.map((job) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              job.toString(),
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 10),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Actor Meta Footer
                  Text(
                    'Played by:',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 9,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    character.actorName,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
