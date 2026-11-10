# Her Space — Flutter Assignment

A small, feminine personal-space app built with Flutter and Material 3.

## Included assignment requirements
- Three pages: Home, About, Contact.
- Home → About button (`Explore About Me`).
- About → Contact button (`Get in Touch`).
- Each page displays its page name in the AppBar/content.
- Home page includes a bundled local image.
- Material icons are used throughout the app.
- Uses `Scaffold`, `AppBar`, `SafeArea`, `Column`, `SingleChildScrollView`, cards and `NavigationBar`.
- Bonus: custom pastel theme and bottom navigation.

## Personalize before submission
Open `lib/data/profile_data.dart` and replace:
- `name`
- `tagline`
- `about`
- `email`
- `phone`
- `social`
- `location`
- `interests`

The current values are placeholders. Add her own portrait if she wants, by replacing the avatar icon in `lib/screens/about_page.dart` with an `Image.asset` and adding the image to `assets/images/`.

## Run the app
1. Install Flutter SDK and Android Studio (or VS Code with Flutter extension).
2. Open this folder in VS Code / Android Studio.
3. In the project terminal, run:

```bash
flutter pub get
# To run on connected Android phone or emulator:
flutter run
# Or to run on Chrome Web:
flutter run -d chrome
```

## GitHub submission
Create a new public GitHub repository named `her-space-flutter`.
Then, from this folder:

```bash
git init
git add .
git commit -m "Create Her Space Flutter assignment"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/her-space-flutter.git
git push -u origin main
```

Replace `YOUR-USERNAME` with the actual GitHub username.

After pushing, copy the repository URL and paste it into the submission PDF. Do not submit the PDF with the placeholder URL.
