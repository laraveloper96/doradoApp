# Technical Requirements Document (TRD)
## Currency Converter App - Eldorado.io Challenge

---

### 1. Technical Overview

#### 1.1 Architecture Pattern
**Feature-First Clean Architecture** - Una variación de Clean Architecture organizada por características donde cada feature se divide en tres capas principales:

- **Presentation Layer**: UI components, screens, y Cubit para manejo de estado
- **Domain Layer**: Lógica de negocio, entidades, y contratos de repositorios
- **Data Layer**: Implementación de repositorios y fuentes de datos

#### 1.2 Data Flow
1. UI (Widget) llama directamente a métodos del Cubit
2. Cubit recibe la llamada y ejecuta un use case en la capa Domain
3. Use Case utiliza un Repository (interface) para solicitar datos
4. Data layer implementa el Repository, obteniendo información de la fuente correspondiente
5. Los datos fluyen de vuelta a través de las capas hasta el Cubit, que emite un nuevo State
6. La UI se reconstruye automáticamente al recibir el nuevo estado

---

### 2. Tech Stack & Dependencies

#### 2.1 Development Tools
- **FVM (Flutter Version Management)**: Para gestión de versiones de Flutter
- **Very Good CLI**: Para scaffolding y mejores prácticas de desarrollo

#### 2.2 Setup Commands
```bash
# Install FVM (if not already installed)
dart pub global activate fvm

# Install Very Good CLI
dart pub global activate very_good_cli

# Setup Flutter version with FVM
fvm install 3.24.0
fvm use 3.24.0

# Create project with Very Good CLI
very_good create flutter_app currency_converter --desc "Currency Converter App for Eldorado.io Challenge"
```

#### 2.3 Core Framework
```yaml
dependencies:
  flutter: ^3.24.0
  
  # State Management
  flutter_bloc: ^8.1.6
  
  # Navigation
  go_router: ^14.2.7
  
  # Internationalization
  intl: ^0.19.0
  
  # Code Generation & Immutability
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  
  # HTTP Client
  dio: ^5.7.0
  
  # Dependency Injection
  get_it: ^8.0.0
  injectable: ^2.4.4
  
  # Utilities
  equatable: ^2.0.5

dev_dependencies:
  # Code Generation
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  build_runner: ^2.4.12
  injectable_generator: ^2.6.2
  
  # Testing
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.7
  mocktail: ^1.0.4
  
  # Linting
  flutter_lints: ^4.0.0
  very_good_analysis: ^6.0.0
```

#### 2.4 Error Handling Pattern
En lugar de usar `dartz`, implementaremos un patrón personalizado:
```dart
typedef Result<T> = Future<(Failure?, T?)>;
```

---

### 3. Project Structure

```
lib/
├── src/
│   ├── core/                           # Cross-cutting concerns
│   │   ├── constants/                  # App constants
│   │   │   ├── api_constants.dart
│   │   │   └── app_constants.dart
│   │   ├── error/                      # Error handling
│   │   │   ├── failures.dart
│   │   │   └── exceptions.dart
│   │   ├── network/                    # Network configuration
│   │   │   ├── dio_client.dart
│   │   │   └── network_info.dart
│   │   ├── router/                     # App routing
│   │   │   └── app_router.dart
│   │   ├── theme/                      # App theming
│   │   │   ├── app_theme.dart
│   │   │   ├── colors.dart
│   │   │   └── text_styles.dart
│   │   └── utils/                      # Utilities
│   │       ├── extensions.dart
│   │       └── formatters.dart
│   ├── features/                       # App features
│   │   └── currency_conversion/        # Main feature
│   │       ├── data/                   # Data layer
│   │       │   ├── datasources/
│   │       │   │   ├── currency_remote_datasource.dart
│   │       │   │   └── currency_remote_datasource_impl.dart
│   │       │   ├── models/
│   │       │   │   ├── conversion_response_model.dart
│   │       │   │   ├── currency_model.dart
│   │       │   │   └── exchange_rate_model.dart
│   │       │   └── repositories/
│   │       │       └── currency_repository_impl.dart
│   │       ├── domain/                 # Domain layer
│   │       │   ├── entities/
│   │       │   │   ├── conversion_result.dart
│   │       │   │   ├── currency.dart
│   │       │   │   └── exchange_rate.dart
│   │       │   ├── repositories/
│   │       │   │   └── currency_repository.dart
│   │       │   └── usecases/
│   │       │       ├── convert_currency.dart
│   │       │       ├── get_currencies.dart
│   │       │       └── get_exchange_rate.dart
│   │       └── presentation/           # Presentation layer
│   │           ├── cubit/
│   │           │   ├── exchange_cubit.dart
│   │           │   └── exchange_state.dart
│   │           ├── pages/
│   │           │   └── exchange_page.dart
│   │           └── widgets/
│   │               ├── amount_input_widget.dart
│   │               ├── conversion_result_widget.dart
│   │               ├── currency_selector_widget.dart
│   │               └── swap_button_widget.dart
│   ├── shared/                         # Shared components
│   │   ├── widgets/
│   │   │   ├── custom_button.dart
│   │   │   ├── custom_text_field.dart
│   │   │   ├── error_widget.dart
│   │   │   └── loading_widget.dart
│   │   └── utils/
│   │       └── validators.dart
│   └── injection_container.dart        # Dependency injection setup
└── main.dart                          # App entry point
```

---

### 4. Core Layer Implementation

#### 4.1 Error Handling
```dart
// core/error/failures.dart
@freezed
class Failure with _$Failure {
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;
  
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;
  
  const factory Failure.validation({
    required String message,
  }) = ValidationFailure;
  
  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;
}
```

#### 4.2 Network Configuration
```dart
// core/network/dio_client.dart
@injectable
class DioClient {
  late final Dio _dio;
  
  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
    
    _dio.interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);
  }
  
  Dio get dio => _dio;
}
```

#### 4.3 App Router
```dart
// core/router/app_router.dart
@injectable
class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const CurrencyConversionPage(),
      ),
    ],
  );
  
  static GoRouter get router => _router;
}
```

---

### 5. Feature Implementation

#### 5.1 Domain Layer

##### 5.1.1 Entities
```dart
// domain/entities/currency.dart
@freezed
class Currency with _$Currency {
  const factory Currency({
    required String id,
    required String name,
    required String symbol,
    required CurrencyType type,
    String? iconUrl,
  }) = _Currency;
}

enum CurrencyType { fiat, crypto }
```

```dart
// domain/entities/conversion_result.dart
@freezed
class ConversionResult with _$ConversionResult {
  const factory ConversionResult({
    required double amount,
    required Currency fromCurrency,
    required Currency toCurrency,
    required double convertedAmount,
    required ExchangeRate exchangeRate,
    required DateTime timestamp,
  }) = _ConversionResult;
}
```

##### 5.1.2 Repository Contract
```dart
// domain/repositories/currency_repository.dart
abstract class CurrencyRepository {
  Future<(Failure?, List<Currency>?)> getCurrencies();
  Future<(Failure?, ExchangeRate?)> getExchangeRate(
    String fromCurrency,
    String toCurrency,
  );
  Future<(Failure?, ConversionResult?)> convertCurrency({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  });
}
```

##### 5.1.3 Use Cases
```dart
// domain/usecases/convert_currency.dart
@injectable
class ConvertCurrency {
  final CurrencyRepository _repository;
  
  ConvertCurrency(this._repository);
  
  Future<(Failure?, ConversionResult?)> call({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    if (amount <= 0) {
      return (
        const Failure.validation(message: 'Amount must be greater than 0'),
        null
      );
    }
    
    if (fromCurrency == toCurrency) {
      return (
        const Failure.validation(message: 'Cannot convert same currency'),
        null
      );
    }
    
    return await _repository.convertCurrency(
      amount: amount,
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
    );
  }
}
```

#### 5.2 Data Layer

##### 5.2.1 Models
```dart
// data/models/currency_model.dart
@freezed
class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    required String id,
    required String name,
    required String symbol,
    required String type,
    String? iconUrl,
  }) = _CurrencyModel;
  
  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
      
  const CurrencyModel._();
  
  Currency toEntity() => Currency(
    id: id,
    name: name,
    symbol: symbol,
    type: type == 'FIAT' ? CurrencyType.fiat : CurrencyType.crypto,
    iconUrl: iconUrl,
  );
}
```

##### 5.2.2 Data Source
```dart
// data/datasources/currency_remote_datasource_impl.dart
@Injectable(as: CurrencyRemoteDataSource)
class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final DioClient _dioClient;
  
  CurrencyRemoteDataSourceImpl(this._dioClient);
  
  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      final response = await _dioClient.dio.get('/currencies');
      final List<dynamic> data = response.data;
      return data.map((json) => CurrencyModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Server error occurred',
        statusCode: e.response?.statusCode,
      );
    }
  }
  
  @override
  Future<ConversionResponseModel> convertCurrency({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    try {
      final response = await _dioClient.dio.post('/convert', data: {
        'amount': amount,
        'from': fromCurrency,
        'to': toCurrency,
      });
      return ConversionResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? 'Conversion failed',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
```

##### 5.2.3 Repository Implementation
```dart
// data/repositories/currency_repository_impl.dart
@Injectable(as: CurrencyRepository)
class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyRemoteDataSource _remoteDataSource;
  
  CurrencyRepositoryImpl(this._remoteDataSource);
  
  @override
  Future<(Failure?, List<Currency>?)> getCurrencies() async {
    try {
      final models = await _remoteDataSource.getCurrencies();
      final entities = models.map((model) => model.toEntity()).toList();
      return (null, entities);
    } on ServerException catch (e) {
      return (Failure.server(message: e.message, statusCode: e.statusCode), null);
    } on NetworkException catch (e) {
      return (Failure.network(message: e.message), null);
    } catch (e) {
      return (Failure.unknown(message: e.toString()), null);
    }
  }
  
  @override
  Future<(Failure?, ConversionResult?)> convertCurrency({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    try {
      final response = await _remoteDataSource.convertCurrency(
        amount: amount,
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
      );
      final result = response.toEntity();
      return (null, result);
    } on ServerException catch (e) {
      return (Failure.server(message: e.message, statusCode: e.statusCode), null);
    } on NetworkException catch (e) {
      return (Failure.network(message: e.message), null);
    } catch (e) {
      return (Failure.unknown(message: e.toString()), null);
    }
  }
}
```

#### 5.3 Presentation Layer

##### 5.3.1 Cubit State
```dart
// presentation/cubit/exchange_state.dart
@freezed
class ExchangeState with _$ExchangeState {
  const factory ExchangeState({
    @Default([]) List<Currency> currencies,
    Currency? fromCurrency,
    Currency? toCurrency,
    @Default(0.0) double amount,
    ConversionResult? conversionResult,
    @Default(false) bool isLoading,
    @Default(false) bool isConverting,
    Failure? failure,
  }) = _ExchangeState;
}
```

##### 5.3.2 Cubit Implementation
```dart
// presentation/cubit/exchange_cubit.dart
@injectable
class ExchangeCubit extends Cubit<ExchangeState> {
  final GetCurrencies _getCurrencies;
  final ConvertCurrency _convertCurrency;
  
  ExchangeCubit(
    this._getCurrencies,
    this._convertCurrency,
  ) : super(const ExchangeState());
  
  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true, failure: null));
    
    final (failure, currencies) = await _getCurrencies();
    
    if (failure != null) {
      emit(state.copyWith(isLoading: false, failure: failure));
      return;
    }
    
    final fiatCurrencies = currencies!.where((c) => c.type == CurrencyType.fiat).toList();
    final cryptoCurrencies = currencies.where((c) => c.type == CurrencyType.crypto).toList();
    
    emit(state.copyWith(
      isLoading: false,
      currencies: currencies,
      fromCurrency: fiatCurrencies.isNotEmpty ? fiatCurrencies.first : null,
      toCurrency: cryptoCurrencies.isNotEmpty ? cryptoCurrencies.first : null,
    ));
  }
  
  void updateAmount(double amount) {
    emit(state.copyWith(amount: amount));
    if (state.fromCurrency != null && state.toCurrency != null && amount > 0) {
      convertCurrency();
    }
  }
  
  void updateFromCurrency(Currency currency) {
    emit(state.copyWith(fromCurrency: currency, conversionResult: null));
    if (state.amount > 0 && state.toCurrency != null) {
      convertCurrency();
    }
  }
  
  void updateToCurrency(Currency currency) {
    emit(state.copyWith(toCurrency: currency, conversionResult: null));
    if (state.amount > 0 && state.fromCurrency != null) {
      convertCurrency();
    }
  }
  
  Future<void> convertCurrency() async {
    if (state.fromCurrency == null || state.toCurrency == null || state.amount <= 0) {
      return;
    }
    
    emit(state.copyWith(isConverting: true, failure: null));
    
    final (failure, result) = await _convertCurrency(
      amount: state.amount,
      fromCurrency: state.fromCurrency!.id,
      toCurrency: state.toCurrency!.id,
    );
    
    emit(state.copyWith(
      isConverting: false,
      conversionResult: result,
      failure: failure,
    ));
  }
  
  void swapCurrencies() {
    final temp = state.fromCurrency;
    emit(state.copyWith(
      fromCurrency: state.toCurrency,
      toCurrency: temp,
      conversionResult: null,
    ));
    
    if (state.amount > 0) {
      convertCurrency();
    }
  }
}
```

---

### 6. UI Implementation Guidelines

#### 6.1 Main Screen Structure
```dart
// presentation/pages/exchange_page.dart
class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExchangeCubit>()
        ..initialize(),
      child: const ExchangeView(),
    );
  }
}

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: BlocConsumer<ExchangeCubit, ExchangeState>(
        listener: (context, state) {
          if (state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure!.message)),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                AmountInputWidget(),
                SizedBox(height: 16),
                CurrencySelectorWidget(isFromCurrency: true),
                SizedBox(height: 8),
                SwapButtonWidget(),
                SizedBox(height: 8),
                CurrencySelectorWidget(isFromCurrency: false),
                SizedBox(height: 24),
                ConversionResultWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

#### 6.2 Widget Components
- **AmountInputWidget**: Input numérico con validación
- **CurrencySelectorWidget**: Dropdown para selección de monedas
- **SwapButtonWidget**: Botón para intercambiar monedas
- **ConversionResultWidget**: Display del resultado de conversión

---

### 7. Testing Strategy

#### 7.1 Unit Tests
- **Domain Layer**: Test de use cases y entidades
- **Data Layer**: Test de repositorios y data sources (con mocks)
- **Presentation Layer**: Test de Cubits con bloc_test

#### 7.2 Widget Tests
- Test de widgets individuales
- Test de integración de pantallas

#### 7.3 Integration Tests
- Test de flujo completo de conversión
- Test de manejo de errores

---

### 8. Performance Considerations

#### 8.1 State Management
- Uso de Freezed para inmutabilidad y performance
- BLoC pattern para manejo eficiente de estado
- Debouncing en input de cantidad para evitar llamadas excesivas

#### 8.2 Network Optimization
- Timeout configurado en Dio
- Retry logic para requests fallidos
- Caching de lista de monedas

#### 8.3 UI Performance
- Uso de const constructors donde sea posible
- Lazy loading de widgets pesados
- Optimización de rebuilds con BlocBuilder

---

### 9. Security Considerations

- No exposición de API keys en el código
- Validación de inputs del usuario
- Manejo seguro de errores sin exponer información sensible
- HTTPS para todas las comunicaciones

---

### 10. Deployment & Build Configuration

#### 10.1 Build Commands
```bash
# Code generation with FVM
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# Run tests with FVM
fvm flutter test

# Analyze code with FVM
fvm flutter analyze

# Build for release with FVM
fvm flutter build apk --release
fvm flutter build ios --release

# Run app with FVM
fvm flutter run

# Development commands
fvm flutter pub get
fvm flutter clean
```

#### 10.2 Environment Configuration
- Configuración de diferentes endpoints para dev/prod
- Manejo de variables de entorno

---

### 11. Maintenance & Scalability

#### 11.1 Code Quality
- Uso de flutter_lints para análisis estático
- Documentación de APIs públicas
- Consistent naming conventions

#### 11.2 Scalability
- Arquitectura preparada para nuevas features
- Separación clara de responsabilidades
- Dependency injection para fácil testing y mantenimiento

---

### 12. Implementation Timeline

#### Phase 1: Core Setup (2-3 hours)
- Project structure setup with Very Good CLI
- Dependencies configuration
- Core layer implementation
- Dependency injection setup

#### Phase 2: Domain Layer (2-3 hours)
- Entities with Freezed
- Repository contracts
- Use cases implementation

#### Phase 3: Data Layer (2-3 hours)
- Models with Freezed
- Data sources implementation
- Repository implementation
- API integration

#### Phase 4: Presentation Layer (3-4 hours)
- BLoC implementation with Freezed
- UI components
- Main screen implementation
- Error handling UI

#### Phase 5: Testing & Polish (2-3 hours)
- Unit tests with Very Good CLI testing patterns
- Widget tests
- Bug fixes and optimization
- Final polish

**Total Estimated Time**: 11-16 hours

---

### 13. Acceptance Criteria Checklist

- [ ] ✅ Feature-first Clean Architecture implemented
- [ ] ✅ All models use Freezed for immutability
- [ ] ✅ Error handling with Future<(Failure?, Result?)> pattern
- [ ] ✅ BLoC/Cubit with Freezed for state management
- [ ] ✅ Currency conversion functionality working
- [ ] ✅ Swap functionality implemented
- [ ] ✅ Input validation and error handling
- [ ] ✅ Loading states and user feedback
- [ ] ✅ Clean, maintainable code structure
- [ ] ✅ Proper dependency injection setup

---

**Note**: Este TRD está diseñado para implementar el Currency Converter siguiendo las mejores prácticas de Flutter y la arquitectura especificada, garantizando código limpio, escalable y mantenible.