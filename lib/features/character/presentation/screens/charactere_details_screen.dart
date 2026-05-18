import 'package:flutter/material.dart';
import 'package:state_management_learn/features/character/data/models/character_model.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterModel character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121214), // Matches your dark slate theme
      body: CustomScrollView(
        slivers: [
          // 1. Immersive Dynamic App Bar Header
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height *
                0.45, // Uses 45% of screen height
            pinned: true,
            backgroundColor: const Color(0xFF1A1A1E),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    character.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  // Smooth black ambient gradient fade at the bottom of the image
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF121214),
                        ],
                        stops: [0.6, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. Body Details Context
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Full Name Label
                  Text(
                    character.fullName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Series Association Name
                  Text(
                    'Featured in: ${character.serieName}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Quick Statistics Cards Row
                  Row(
                    children: [
                      _buildStatItem(Icons.movie_outlined, 'Episodes',
                          character.episodesCount),
                      const SizedBox(width: 12),
                      _buildStatItem(
                          Icons.cake_outlined, 'Birthday', character.birthday),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Occupations / Jobs Section
                  const Text(
                    'Occupations & Roles',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: character.jobs.map((job) {
                      return Chip(
                        label: Text(job.toString()),
                        backgroundColor: Colors.blueAccent.withOpacity(0.15),
                        labelStyle:
                            const TextStyle(color: Colors.blue, fontSize: 13),
                        side: BorderSide(
                            color: Colors.blueAccent.withOpacity(0.3)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 28),

                  // Actor Meta Profile Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber.withOpacity(0.1),
                          radius: 24,
                          child: const Icon(Icons.star, color: Colors.amber),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Voice / Live Actor',
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              character.actorName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Private Helper to generate structural grid detail pills safely
  Widget _buildStatItem(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.amber, size: 24),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
