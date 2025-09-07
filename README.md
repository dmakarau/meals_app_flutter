# Flutter Meals App

A comprehensive Flutter application for browsing meal categories, exploring recipes, and managing favorites. This project initially follows the Udemy course "Flutter & Dart - The Complete Guide" as a foundation for learning Flutter development, with personal experimentation and additional features added along the way.

## 📱 Features

- **Browse Meal Categories**: View various meal categories in a responsive grid layout
- **Recipe Details**: Read detailed cooking instructions for selected meals
- **Favorites System**: Mark and manage favorite meals for easy access
- **Navigation Tabs**: Switch seamlessly between all meals and favorites
- **Advanced Filtering**: Apply filters such as vegan, gluten-free, and other dietary preferences
- **Multi-Screen Navigation**: Navigate through multiple interconnected screens

## 🏗️ Architecture

The app follows standard Flutter architecture patterns with multiple screens and navigation flow:

- **Entry Point**: `lib/main.dart` - MaterialApp setup with Material Design 3 theming
- **Categories Screen**: `lib/categories.dart` - Grid layout for meal categories
- **Recipe Screens**: Individual meal detail screens with instructions
- **Favorites Management**: System for marking and viewing favorite meals
- **Filter Screen**: Advanced filtering options for dietary preferences

## 🎨 Design & UI

- **Material Design 3**: Modern design system with custom orange color scheme
- **Dark Theme**: Default dark theme for better user experience
- **Typography**: Google Fonts (Lato) for consistent and readable text
- **Responsive Grid**: 2-column grid layout with 3:2 aspect ratio for categories
- **Smooth Navigation**: Intuitive navigation between different app sections

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- iOS Simulator / Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd meals
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 🛠️ Development Commands

- `flutter run` - Run the app in debug mode
- `flutter build apk` - Build Android APK
- `flutter build ios` - Build iOS app
- `flutter test` - Run tests
- `flutter analyze` - Run static analysis
- `flutter pub get` - Get dependencies
- `flutter pub upgrade` - Upgrade dependencies
- `flutter clean` - Clean build artifacts

## 📦 Dependencies

### Production Dependencies
- **google_fonts**: ^6.3.1 - Lato font family integration
- **cupertino_icons**: ^1.0.8 - iOS style icons

### Development Dependencies
- **flutter_lints**: ^5.0.0 - Code quality and linting rules
- **flutter_test** - Testing framework

## 📁 Project Structure

```
lib/
├── main.dart           # App entry point and theme configuration
├── categories.dart     # Categories grid screen
├── models/            # Data models (meals, categories)
├── screens/           # App screens (meal details, favorites, filters)
├── widgets/           # Reusable UI components
└── data/             # Static data and dummy content
```

## 🎓 Learning Objectives

This project demonstrates key Flutter concepts:

- **Widget Composition**: Building complex UIs with Flutter widgets
- **Navigation**: Implementing multi-screen navigation patterns
- **State Management**: Managing app state across different screens
- **Material Design**: Applying Material Design 3 principles
- **Responsive Design**: Creating layouts that work on different screen sizes
- **Custom Theming**: Implementing custom themes and color schemes
- **Data Modeling**: Structuring and managing app data

## 🔄 Navigation Flow

```
Categories → Meal Details → Recipe Instructions
    ↓              ↓
Favorites ←→ Filter Screen
```

## 📚 Course Reference

This project initially follows the Udemy course **"Flutter & Dart - The Complete Guide"** as a foundation for learning Flutter development. While the core structure and concepts are based on the course content, this implementation includes personal experimentation and additional features to enhance the learning experience.

The implementation serves as hands-on practice for:
- Flutter widget system
- Navigation and routing
- State management techniques
- UI/UX best practices
- Mobile app development patterns

## 🤝 Contributing

This is a learning project that combines course materials with personal experimentation. Feel free to explore the code, suggest improvements, or use it as a reference for your own Flutter learning journey.

## 📄 License

This project is created for educational purposes, initially following a Flutter learning course and enhanced with personal experimentation.
