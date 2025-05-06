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
