_# cinetradexa

A new Flutter project.

## Getting Started

CineTradexa is a Flutter-based movie search application that allows users to search for movies by their title using the OMDB API. It provides a simple user interface where users can input a movie title and view a list of matching movies, complete with posters, titles, release years, and IMDB IDs.

Features

Search for movies using the OMDB API.

Display movie details including poster, title, release year, and IMDB ID.

Clean and responsive UI with a search bar and a dynamic list view.

Utilizes Provider for state management (optional bonus).


├── lib
│   ├── api.dart                 # Contains logic for making API calls to OMDB
│   ├── main.dart                # Main entry point of the app
│   ├── providers
│   │   └── movie_provider.dart  # Handles the state management using Provider
├── pubspec.yaml                 # Dependencies and project configuration

