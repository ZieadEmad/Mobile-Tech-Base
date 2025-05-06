Flutter Base Clean Architecture 

UI (SignInCubit)
↓
SignInUseCase (Domain Layer)
↓
AuthRepository (Interface - Domain)
↓
AuthRepositoryImpl (Implements AuthRepository - Data Layer)
↓
AuthRemoteDataSource (Interface - Data Layer)
↓
AuthRemoteDataSourceImpl (Concrete - Data Layer)
↓
NetworkService (Core Layer)