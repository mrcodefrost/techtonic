## Techtonic Blog App

**Blog App** : A feature-rich mobile application built using Flutter that serves as a platform for users to create, read, and interact with blog posts.

### Features

- **Clean Architecture**: The app adheres to clean architecture principles, ensuring a modular, maintainable, and scalable codebase.

- **Functional Programming with `fp_dart`**: Utilizes the `fp_dart` package to incorporate functional programming paradigms, enhancing code reliability and reducing side effects.

- **Dependency Injection with `get_it`**: Employs the `get_it` package for efficient dependency injection, promoting loose coupling and testability within the application.

- **Local Storage with Hive**: Integrates **Hive**, a lightweight and blazing-fast key-value database, for local data persistence, offering an offline-first experience to users.

- **Online Database and Authentication with Supabase**: Leverages **Supabase** for robust online database management and secure user authentication, providing real-time data synchronization and user management features.

This blog app demonstrates the synergy of clean architecture, functional programming, dependency injection, and modern data storage techniques, offering a comprehensive and performant solution for mobile blogging.

### Tech Stack

- Flutter - UI
- Supabase - online DB & Auth
- Hive - local DB
- Get It - dependency injection
- FP Dart - functional programming



### Installation

1. Clone the repository to your local machine:

   ```bash
   git clone https://github.com/mrcodefrost/techtonic.git
   ```

2. Install dependencies by running this command in IDE terminal: 

   ```bash
   flutter pub get
   ```
   
3. Set up Supabase

   If you haven't already, create a project on [supabase](https://supabase.com).
   If required, Refer to the [Supabase flutter plugin docs](https://pub.dev/packages/supabase_flutter)

   ```bash
   flutter pub get
   ```

4. Create a directory "secrets" in lib/core/.

5. In lib/core/secrets add "app_secrets.dart" with the following file content.
Keys can be found in your supabase project config page.

   ```dart
   class AppSecrets {
   static const String supabaseUrl = 'Insert your supabase url here';
   static const String supabaseAnonKey =
   'Insert your supabase anon key here';
   }
   ```