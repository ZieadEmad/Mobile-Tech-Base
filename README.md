## 📂 Layer Descriptions

### 1. **UI Layer**
- **Component**: `SignInCubit`
- **Role**: Handles user interaction and UI logic. Communicates with the domain layer by invoking use cases.
- **Tools**: Uses Bloc/Cubit for state management.

### 2. **Domain Layer**
- **Component**: `SignInUseCase`
- **Role**: Contains the business logic. Operates on abstract repository interfaces rather than implementations.
- **Characteristics**: Pure Dart, independent of Flutter.

### 3. **Domain Repository Interface**
- **Component**: `AuthRepository`
- **Role**: An abstract class that defines the contract for authentication-related operations. Implemented by the data layer.

### 4. **Data Layer - Repository Implementation**
- **Component**: `AuthRepositoryImpl`
- **Role**: Implements the domain's repository interface. Coordinates data flow from remote or local sources.

### 5. **Data Layer - Remote Data Source Interface**
- **Component**: `AuthRemoteDataSource`
- **Role**: Abstract interface for external data interactions (e.g., APIs).

### 6. **Data Layer - Remote Data Source Implementation**
- **Component**: `AuthRemoteDataSourceImpl`
- **Role**: Concrete implementation of the remote data source. Contains actual API calls.

### 7. **Core Layer**
- **Component**: `NetworkService`
- **Role**: Provides low-level services like HTTP requests, shared across data sources.

---

## ✅ Benefits

- **Separation of concerns**: Each layer has a single responsibility.
- **Testability**: Business logic is independent and easily testable.
- **Scalability**: New features can be added with minimal changes

///========================================
commands

[//]: # ( to Generate translation keys)
==>    flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart"  -f keys
==>    flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"
 # ( if you want automaticly listen to the changeing in the json translation files )
    firest install  if not instaled
==>     npm install -g chokidar-cli
    then
==>     chokidar "assets/translations/*.json" -c "flutter pub run easy_localization:generate -S assets/translations -O lib/translations -o locale_keys.g.dart -f keys && flutter pub run easy_localization:generate -S assets/translations -O lib/translations"
  
[//]: # (to activate gen assets)
==>     dart pub global activate flutter_gen
    then
        flutter pub run build_runner build