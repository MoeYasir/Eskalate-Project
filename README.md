# Eskalate-Project

# Eskalate Project - Countries & Favorites App

A Flutter app that displays a list of countries fetched from an API, with search and favorites functionality. Users can view details about each country, mark favorites, and toggle between Home and Favorites views using a bottom navigation bar.

## Features

- Fetch and display a list of countries
- Search countries by name with a search bar
- Mark/unmark countries as favorites
- View favorite countries in a separate tab
- Country details page showing info like population, area, region, subregion, and timezones
- Pull-to-refresh functionality on both Home and Favorites tabs
- Persistent favorites stored locally using SharedPreferences
- State management with GetX

## Project Structure

- `lib/controllers/` — GetX controllers for state management
- `lib/models/` — Data models (e.g., CountryModel)
- `lib/views/` — UI pages like HomePage, CountryDetailsPage, FavoritesPage
- `lib/widgets/` — Reusable widgets (e.g., country grid and cards)
- `lib/services/` — API service for fetching country data
- `lib/app/routes.dart` — App route definitions

## Getting Started

### Prerequisites

- Flutter SDK installed ([flutter.dev](https://flutter.dev/docs/get-started/install))
- Dart SDK (comes with Flutter)
- Android Studio, VS Code, or other IDE configured for Flutter development

### Run the App

1. Clone this repository:
   ```bash
   git clone https://github.com/MoeYasir/eskalate_project.git
   cd eskalate_project
   ```
2. Get dependencies:
   flutter pub get

3. Run the app on an emulator or connected device::
   flutter run

### Notes

The app uses GetX for state management and routing.
Favorites are stored locally with SharedPreferences and persist across app restarts.
The API endpoint URL is configured inside ApiService (replace with your actual endpoint).
