# Her Space — Academic Project Presentation

This directory contains the source code, design assets, and automated generation script for the **Her Space** academic presentation prepared for **AI 413 — Interactive Systems Design**.

---

## Deliverable

- **PDF Output:** [`Her_Space_Project_Presentation.pdf`](./Her_Space_Project_Presentation.pdf)
- **Format:** 16:9 Widescreen Landscape (1152 × 648 pt / printable 16in × 9in)
- **Length:** Exactly 7 slides
- **Visual Identity:** Soft feminine pastel palette (Warm Cream, Pale Pink, Soft Blush, Dusty Rose, Deep Soft Rose). **Strictly zero black or dark visual elements.**

---

## Slide Outline

1. **Cover:** Project title (*Her Space*), subtitle (*A little space for all things lovely*), signature floral-heart emblem, course details (*AI 413 Interactive Systems Design*), and author (*Nourhan Qamar*).
2. **Project Overview:** Core concept as a personal digital haven, purpose, and the three main sections (Home, About Me, Contact).
3. **Design Identity & System:** Complete color palette with hex values, typography pairings, floral emblem symbolism, and core design principles.
4. **Home & About Me:** High-resolution live application captures inside mobile mockups, highlighting the welcome greeting, hero illustration, bio narrative, quote card, and 8 interest chips.
5. **Contact & Navigation:** Live application capture of the contact screen, email and phone cards, non-interactive social placeholder badges, bottom navigation architecture, and a public privacy notice.
6. **Technical Implementation Flow:** Visual 5-stage architecture pipeline (Entry Point `main.dart` → Configuration `AppTheme`/`ProfileData` → Navigation `MainNavigation` → 3 Screens → Reusable `SoftCard` & Assets), complemented by technical annotations covering Material 3 theming, stateful `IndexedStack` routing, and cross-platform verification.
7. **Repository & Academic Submission:** Official submission deliverable for Delta University for Science and Technology (Faculty of Artificial Intelligence, AI 413), student Nourhan Qamar (*Qamar*), planned repository `her-space-flutter`, prominent configurable repository URL placeholder, closing statement (*Designed with care. Built with Flutter.*), and submission verification checklist.

---

## Directory Structure

```text
presentation/
├── index.html                           # Source HTML presentation with 7 dedicated 16:9 slides
├── styles.css                           # Print & screen stylesheet enforcing pastel visual identity
├── config.json                          # Central configuration file for repository URL and metadata
├── generate_pdf.ps1                     # Automated PowerShell script for reproducible PDF generation
├── README.md                            # Documentation for presentation maintenance
├── Her_Space_Project_Presentation.pdf   # Generated high-resolution 7-page PDF presentation
└── assets/
    ├── branding/
    │   ├── logo.png                     # Master floral-heart logo (Warm Cream background)
    │   └── splash_icon.png              # Native splash emblem
    ├── screenshots/
    │   ├── home.png                     # Live capture of Home screen (824 × 1784)
    │   ├── about.png                    # Live capture of About Me screen (824 × 1784)
    │   └── contact.png                  # Live capture of Contact screen (824 × 1784)
    └── slides_preview/
        ├── slide_1.png ... slide_7.png  # Rendered slide preview images for inspection
```

---

## Updating the GitHub Repository URL

The repository URL is maintained centrally in `presentation/config.json`:

```json
{
  "projectName": "Her Space",
  "repositoryUrl": "REPOSITORY_URL_TO_BE_ADDED"
}
```

### Steps to Update & Regenerate:

1. Open `presentation/config.json`.
2. Replace `"REPOSITORY_URL_TO_BE_ADDED"` with your actual GitHub repository URL (e.g. `"https://github.com/USERNAME/her-space-flutter"`).
3. In PowerShell, run the generator script:

```powershell
.\presentation\generate_pdf.ps1
```

The script will automatically:
- Read `config.json`.
- Synchronize the repository URL into `index.html`.
- Launch headless Chrome / Edge to re-render the presentation.
- Overwrite `presentation/Her_Space_Project_Presentation.pdf` with the updated URL on Slide 7.

---

## Visual Design Standards

- **Background:** Warm Cream (`#FFF9F7`) and Pale Pink (`#FFEAF0`).
- **Cards & Surfaces:** Pure White with 88% opacity and Soft Rose borders (`#F3D3DF`).
- **Primary Typography & Accents:** Deep Soft Rose (`#B85F7B`) and Dusty Rose (`#D98EAA`).
- **Body Text:** Warm Plum Ink (`#5A3D49`) — strictly avoiding harsh `#000000` or dark gray.
- **Font Families:** *Playfair Display* (headings), *Plus Jakarta Sans* / *Inter* (body text).

