# Flutter Graduation Project Documentation

## Project Overview
This documentation provides a detailed overview of the Flutter graduation project's architecture, structure, and implementation details.

## Project Structure
The project follows a clean architecture pattern with the following main directories:

```
lib/
├── core/         # Core functionality and utilities
├── data/         # Data layer (repositories, data sources)
├── domain/       # Domain layer (entities, use cases)
├── di/           # Dependency injection
├── Feature/      # Feature modules
└── main.dart     # Application entry point
```

## Dependencies
The project uses several key dependencies:

### State Management
- `flutter_bloc: ^9.1.0` - For state management using the BLoC pattern

### Networking
- `dio: ^5.8.0+1` - HTTP client for API communication

### Dependency Injection
- `injectable: ^2.5.0` - For dependency injection
- `get_it` - Service locator for dependency injection

### Data Storage
- `shared_preferences: ^2.5.2` - For local data persistence

### UI/UX
- `flutter_easyloading: ^3.0.5` - Loading indicators and toasts
- `google_fonts: ^6.2.1` - Google Fonts integration
- `animate_do: ^4.2.0` - Animation utilities
- `cupertino_icons: ^1.0.8` - iOS-style icons

### Utilities
- `dartz: ^0.10.1` - Functional programming features

### Development Dependencies
- `injectable_generator` - Code generation for dependency injection
- `build_runner` - Code generation tool
- `flutter_lints: ^5.0.0` - Linting rules

## Architecture
The project follows Clean Architecture principles with the following layers:

1. **Presentation Layer (Features)**
   - Contains UI components
   - BLoC/Cubit for state management
   - Widgets and screens

2. **Domain Layer**
   - Business logic
   - Use cases
   - Entity models
   - Repository interfaces

3. **Data Layer**
   - Repository implementations
   - Data sources (Remote/Local)
   - DTOs (Data Transfer Objects)

4. **Core**
   - Shared utilities
   - Constants
   - Common widgets
   - Network handling

## Asset Management
The project includes an assets directory for managing images and other resources:
```
assets/
└── images/      # Image assets
```

## Getting Started
To run the project:

1. Ensure Flutter SDK version ^3.7.2 is installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Build and Deploy
The project supports multiple platforms:
- Android
- iOS
- Web
- Windows
- Linux
- macOS

## Development Guidelines
1. Follow the clean architecture pattern
2. Use dependency injection for better testability
3. Implement proper error handling
4. Follow Flutter's style guide and best practices
5. Use BLoC pattern for state management

## Additional Notes
- The project uses material design with custom Google Fonts
- Animations are implemented using the animate_do package
- Local storage is handled using shared_preferences
- Network calls are made using dio with proper error handling

## Future Improvements
1. Add comprehensive unit tests
2. Implement caching strategy
3. Add CI/CD pipeline
4. Enhance error handling
5. Add performance monitoring

## Contributing
When contributing to this project:
1. Follow the existing architecture
2. Write clean, maintainable code
3. Document new features
4. Test thoroughly before submitting changes

## Features Documentation

### 1. Authentication (login)
- User authentication system
- Login screen implementation
- Session management

### 2. Session Management (session_screen)
- Session handling and tracking
- User session state management
- Session-related functionalities

### 3. Splash Screen
- Initial application loading screen
- App initialization
- Initial data loading

### 4. Attendance System
- Student attendance tracking
- Attendance marking interface
- Attendance reports and statistics

### 5. Subject Management (subject_screen)
- Subject listing and details
- Subject-related operations
- Academic content management

## Technical Implementation

### State Management
The project uses BLoC pattern for state management with the following benefits:
- Separation of business logic from UI
- Predictable state updates
- Easy testing and maintenance

### Data Persistence
- SharedPreferences for local storage
- Secure storage for sensitive data
- Caching mechanisms

### Network Layer
- Dio client for API communication
- Error handling and retry mechanisms
- Response parsing and mapping

### UI/UX Considerations
- Material Design implementation
- Responsive layouts
- Custom animations
- Loading states and error handling
- Cross-platform compatibility 