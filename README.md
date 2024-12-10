# weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. With ChangeNotifier, users will receive real-time weather updates based on their location, 
2. a 5-day forecast, 
3. a dynamic interface reflecting current weather conditions, geolocation support, 
4. robust error handling, 
5. and a state management system


MVVM (Model-View-ViewModel) Pattern:

Model: The WeatherService class encapsulates data retrieval and manipulation, acting as the data source.
ViewModel: The WeatherViewModel class handles business logic, API calls, and data transformations. It exposes observable properties that the View can bind to.
View: The DashboardPage class is responsible for the visual representation of data, binding to the ViewModel's properties for reactive updates.
State Management:

Provider: The ChangeNotifier class is used to implement a reactive state management system. This allows for efficient updates to the UI whenever the underlying data changes.
SOLID Principles:

Single Responsibility Principle: Each class has a well-defined, single responsibility, promoting modularity and maintainability.
Loose Coupling: Components are loosely coupled, reducing dependencies and improving code flexibility. This allows for easier testing, modification, and future expansion.
By adhering to these architectural principles and design patterns, the application aims to achieve a clean, maintainable, and scalable codebase.

Project Structure
lib/
├── constant.dart               // App-wide constants like colors, images, etc.
├── custom_widget/
│   └── weather_widget.dart     // Reusable widget for weather UI
├── models/
│   ├── current_weather.dart    // Model for current weather data
│   └── forecast.dart           // Model for forecast data
├── screens/
│   └── dashboard_page.dart     // Main screen for displaying weather info
├── services/
│   └── weather_service.dart    // API service to fetch weather data
├── view_model/
│   └── weather_view_model.dart // Business logic and state management
└── main.dart                   // App entry point


