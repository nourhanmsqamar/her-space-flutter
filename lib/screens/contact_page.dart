import 'package:flutter/material.dart';
import '../data/profile_data.dart';
import '../theme/app_theme.dart';
import '../widgets/soft_card.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.mail_rounded, color: AppTheme.rose),
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
                  const Text('Let’s stay connected',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 8),
                  const Text('A little message can make someone’s day ♡',
                      style: TextStyle(color: AppTheme.rose, fontSize: 15)),
                  const SizedBox(height: 22),
                  _ContactTile(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      value: ProfileData.email),
                  const SizedBox(height: 12),
                  _ContactTile(
                      icon: Icons.phone_outlined,
                      title: 'Phone',
                      value: ProfileData.phone),
                  const SizedBox(height: 12),
                  _ContactTile(
                      icon: Icons.location_on_outlined,
                      title: 'Location',
                      value: ProfileData.location),
                  const SizedBox(height: 20),

                  // Social Media Profiles (Non-interactive icon placeholders)
                  SoftCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Social Profiles',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Profiles will be connected soon ♡',
                          style: TextStyle(fontSize: 13, color: AppTheme.rose),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: _SocialBadge(
                                icon: Icons.camera_alt_outlined,
                                label: 'Instagram',
                              ),
                            ),
                            Expanded(
                              child: _SocialBadge(
                                icon: Icons.business_center_outlined,
                                label: 'LinkedIn',
                              ),
                            ),
                            Expanded(
                              child: _SocialBadge(
                                icon: Icons.code_rounded,
                                label: 'GitHub',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  const SoftCard(
                    child: Row(children: [
                      Icon(Icons.local_florist_rounded,
                          color: AppTheme.rose, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                          child: Text(
                              'Thank you for visiting Her Space. Have a lovely day!',
                              style: TextStyle(
                                  height: 1.5, fontWeight: FontWeight.w600))),
                    ]),
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

class _ContactTile extends StatelessWidget {
  const _ContactTile(
      {required this.icon, required this.title, required this.value});
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      child: Row(children: [
        Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
                color: AppTheme.palePink, shape: BoxShape.circle),
            child: Icon(icon, color: AppTheme.rose)),
        const SizedBox(width: 14),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(color: AppTheme.rose)),
            ])),
      ]),
    );
  }
}

class _SocialBadge extends StatelessWidget {
  const _SocialBadge({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppTheme.palePink,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppTheme.blush.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Icon(icon, color: AppTheme.rose, size: 22),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.ink,
          ),
        ),
      ],
    );
  }
}
