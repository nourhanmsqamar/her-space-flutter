import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_space/main.dart';

void main() {
  testWidgets('Her Space personal-data consistency and navigation test',
      (WidgetTester tester) async {
    // Set a realistic mobile viewport
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const HerSpaceApp());

    // 1. Home Page Verification
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Welcome to Qamar’s space ✨'), findsOneWidget);
    expect(find.text('Curious Mind, Kind Heart, Endless Possibilities.'),
        findsOneWidget);
    expect(find.text('Explore About Me'), findsOneWidget);

    // 2. Navigation: Home -> About
    await tester.ensureVisible(find.text('Explore About Me'));
    await tester.tap(find.text('Explore About Me'));
    await tester.pumpAndSettle();

    // Verify About Page Content
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Qamar'), findsOneWidget);
    expect(find.text('Nourhan Qamar'), findsOneWidget);
    expect(find.text('Curious Mind, Kind Heart, Endless Possibilities.'),
        findsOneWidget);
    expect(find.text('My Story'), findsOneWidget);
    expect(
        find.textContaining('Nourhan is a curious and thoughtful person'),
        findsOneWidget);
    expect(find.text('Favorite Quote'), findsOneWidget);
    expect(
        find.text(
            '“The more you learn, the more you grow; the more you share, the more you inspire.”'),
        findsOneWidget);
    expect(find.text('Things I Love'), findsOneWidget);
    expect(find.text('Teaching & Explaining'), findsOneWidget);
    expect(find.text('Artificial Intelligence'), findsOneWidget);
    expect(find.text('Get in Touch'), findsOneWidget);

    // 3. Navigation: About -> Contact
    await tester.ensureVisible(find.text('Get in Touch'));
    await tester.tap(find.text('Get in Touch'));
    await tester.pumpAndSettle();

    // Verify Contact Page Content
    expect(find.text('Contact'), findsWidgets);
    expect(find.text('Let’s stay connected'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('NorhanQamar@gmail.com'), findsOneWidget);
    expect(find.text('Phone'), findsOneWidget);
    expect(find.text('01020304050'), findsOneWidget);
    expect(find.text('Location'), findsOneWidget);
    expect(find.text('Kafrelshiekh, Egypt'), findsOneWidget);
    expect(find.text('Social Profiles'), findsOneWidget);
    expect(find.text('Instagram'), findsOneWidget);
    expect(find.text('LinkedIn'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);

    // 4. Test bottom navigation bar back to Home
    await tester.tap(find.text('Home').last);
    await tester.pumpAndSettle();
    expect(find.text('Welcome to Qamar’s space ✨'), findsOneWidget);

    // 5. Test bottom navigation directly to About
    await tester.tap(find.text('About').last);
    await tester.pumpAndSettle();
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Qamar'), findsOneWidget);

    // 6. Test bottom navigation directly to Contact
    await tester.tap(find.text('Contact').last);
    await tester.pumpAndSettle();
    expect(find.text('NorhanQamar@gmail.com'), findsOneWidget);
  });
}
