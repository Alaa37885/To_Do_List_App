# Todo App - Clean Architecture Flutter Project

A professional, production-ready Todo application built with Flutter and Firebase, following **Clean Architecture** principles and **SOLID** design patterns. This project was developed as part of the NTI sessions.

## 🚀 Key Features

- **Authentication System**: Secure Sign-up, Login, and Password recovery using Firebase Auth.
- **Full CRUD Operations**: Create, Read, Update, and Delete tasks seamlessly.
- **Image Integration**: Upload and attach images to tasks using Firebase Storage and Image Picker.
- **Privacy & Security**: User-specific data isolation; each user can only access and manage their own tasks via Firestore filtering.
- **Task Scheduling**: Set deadlines for tasks with an integrated date picker.
- **Multi-language Support**: Full English and Arabic localization using `easy_localization`.
- **Profile Management**: Dynamic profile updates (Name, Email, Password) and live session management.
- **Modern UI/UX**: Clean, responsive design with Material 3 components and custom SVG illustrations.

## 🏗 Architecture (Clean Architecture)

The project is structured into three main layers to ensure maintainability, scalability, and testability:

1.  **Domain Layer**: Contains the core business logic.
    - **Entities**: Simple data objects (e.g., `Todo`).
    - **Repositories (Abstract)**: Contract definitions for data operations.
    - **Use Cases**: Specific business logic triggers (e.g., `FetchTodosUseCase`).
2.  **Data Layer**: Handles data retrieval and persistence.
    - **Models**: Extensions of Entities with JSON serialization logic (`TodoModel`).
    - **Repositories (Implementation)**: Concrete logic for data flow between sources.
    - **Data Sources**: External APIs or Database clients (Firebase Firestore/Storage).
3.  **Presentation Layer**: The UI and State Management.
    - **Controllers (BloC/Cubit)**: Managing UI states and reacting to user events.
    - **UI Screens & Widgets**: Modularized UI components for high reusability.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Flutter BloC / Cubit](https://pub.dev/packages/flutter_bloc)
- **Backend**: [Firebase](https://firebase.google.com/) (Auth, Cloud Firestore, Storage)
- **Localization**: [Easy Localization](https://pub.dev/packages/easy_localization)
- **Dependency Injection**: Manual injection via BloC providers.

## 📂 Project Structure

```text
lib/
├── core/               # App constants, themes, and shared widgets
├── features/           # Feature-based modules
│   ├── auth/           # Login, Signup, and Auth logic
│   ├── home/           # Todo CRUD, UseCases, and Data handling
│   └── profile/        # User settings and profile updates
├── firebase_options.dart # Firebase configuration
└── main.dart           # App entry point
```

## ⚙️ Setup & Installation

1.  **Clone the repository**:
    ```bash
    git clone [(https://github.com/Alaa37885/To_Do_List_App.git)]
    ```
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Firebase Setup**:
    - Create a project on [Firebase Console](https://console.firebase.google.com/).
    - Enable Authentication (Email/Password), Firestore Database, and Storage.
    - Run `flutterfire configure` to sync your local environment.
4.  **Run the app**:
    ```bash
    flutter run
    ```

## 🤝 Contribution

Contributions are welcome! If you have suggestions for new features or improvements, feel free to open an issue or submit a pull request.

## Author : A'laa Omar Hamed
