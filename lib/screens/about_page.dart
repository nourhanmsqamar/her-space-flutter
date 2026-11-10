import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';
import '../widgets/soft_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.onContact});
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Her Space'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.favorite_rounded, color: AppTheme.rose),
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
                children: [
                  const Text('About Me',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.rose)),
                  const SizedBox(height: 14),
                  // Profile Photo / Avatar (Supports assets/images/profile.png with graceful fallback)
                  Container(
                    width: 116,
                    height: 116,
                    decoration: BoxDecoration(
                      color: AppTheme.palePink,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.blush.withValues(alpha: 0.6),
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.rose.withValues(alpha: 0.12),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        ProfileData.profileImagePath,
                        width: 116,
                        height: 116,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(Icons.person_rounded,
                              size: 66, color: AppTheme.rose),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(ProfileData.name,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 3),
                  Text(ProfileData.fullName,
                      style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.rose)),
                  const SizedBox(height: 6),
                  Text(ProfileData.tagline,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppTheme.ink,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 22),

                  // My Story
                  SoftCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('My Story',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 10),
                          Text(ProfileData.about,
                              style: const TextStyle(
                                  height: 1.65, fontSize: 15)),
                        ]),
                  ),
                  const SizedBox(height: 16),

                  // Favorite Quote
                  SoftCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.format_quote_rounded,
                                color: AppTheme.rose, size: 22),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text('Favorite Quote',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '“${ProfileData.quote}”',
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            height: 1.55,
                            fontSize: 14.5,
                            color: AppTheme.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Things I Love
                  SoftCard(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Things I Love',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w800)),
                          const SizedBox(height: 12),
                          Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: ProfileData.interests
                                  .map((item) => Chip(
                                        avatar: const Icon(Icons.favorite,
                                            size: 14, color: AppTheme.rose),
                                        label: Text(item.trim()),
                                        backgroundColor: AppTheme.palePink,
                                        side: BorderSide.none,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ))
                                  .toList()),
                        ]),
                  ),
                  const SizedBox(height: 20),

                  // Navigation Button to Contact
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onContact,
                      icon: const Icon(Icons.mail_outline_rounded),
                      label: const Text('Get in Touch'),
                    ),
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
