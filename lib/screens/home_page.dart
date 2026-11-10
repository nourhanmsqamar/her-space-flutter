import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';
import '../widgets/soft_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onExplore});
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Her Space'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.auto_awesome, color: AppTheme.rose),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('A little hello,',
                      style: TextStyle(fontSize: 17, color: AppTheme.rose)),
                  const SizedBox(height: 5),
                  Text('Welcome to ${ProfileData.name}’s space ✨',
                      style: const TextStyle(
                          fontSize: 27, height: 1.2, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 18),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      'assets/images/home_illustration.png',
                      height: 225,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 225,
                        width: double.infinity,
                        color: AppTheme.palePink,
                        child: const Center(
                          child: Icon(Icons.image_rounded,
                              size: 48, color: AppTheme.rose),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SoftCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Your happy little corner',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text(ProfileData.tagline,
                            style: const TextStyle(fontSize: 15, height: 1.5)),
                        const SizedBox(height: 17),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: onExplore,
                            icon: const Icon(Icons.favorite_rounded, size: 18),
                            label: const Text('Explore About Me'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Center(
                    child: Text('Made with love ♡',
                        style: TextStyle(
                            color: AppTheme.rose, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
