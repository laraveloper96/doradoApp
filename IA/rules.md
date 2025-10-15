# Reglas de Codificación - Flutter

Este documento establece las reglas y mejores prácticas para el desarrollo en Flutter del proyecto Currency Converter.

## 📋 Índice

1. [Principios Generales](#principios-generales)
2. [Arquitectura y Estructura](#arquitectura-y-estructura)
3. [Widgets y UI](#widgets-y-ui)
4. [Gestión de Estado](#gestión-de-estado)
5. [Nomenclatura y Convenciones](#nomenclatura-y-convenciones)
6. [Comentarios y Documentación](#comentarios-y-documentación)
7. [Manejo de Errores](#manejo-de-errores)
8. [Performance y Optimización](#performance-y-optimización)
9. [Testing](#testing)
10. [Linting y Análisis de Código](#linting-y-análisis-de-código)

---

## 🎯 Principios Generales

### 1. Clean Architecture
- **OBLIGATORIO**: Seguir los principios de Clean Architecture
- Separar claramente las capas: `presentation`, `domain`, `data`
- Las dependencias deben apuntar hacia adentro (hacia el dominio)
- Usar inyección de dependencias para el desacoplamiento

### 2. SOLID Principles
- **Single Responsibility**: Cada clase debe tener una sola razón para cambiar
- **Open/Closed**: Abierto para extensión, cerrado para modificación
- **Liskov Substitution**: Los objetos derivados deben ser sustituibles por sus objetos base
- **Interface Segregation**: Muchas interfaces específicas son mejores que una general
- **Dependency Inversion**: Depender de abstracciones, no de concreciones

---

## 🏗️ Arquitectura y Estructura

### Estructura de Carpetas
```
lib/
├── src/
│   ├── core/                 # Funcionalidades compartidas
│   │   ├── constants/        # Constantes globales
│   │   ├── error/           # Manejo de errores
│   │   ├── network/         # Configuración de red
│   │   ├── router/          # Navegación
│   │   ├── theme/           # Temas y estilos
│   │   ├── usecases/        # Casos de uso base
│   │   └── utils/           # Utilidades
│   ├── features/            # Características por módulo
│   │   └── [feature_name]/
│   │       ├── data/        # Capa de datos
│   │       ├── domain/      # Capa de dominio
│   │       └── presentation/ # Capa de presentación
│   └── shared/              # Componentes compartidos
└── main_[environment].dart   # Puntos de entrada por ambiente
```

### Reglas de Importación
- **OBLIGATORIO**: Usar imports relativos para archivos del mismo módulo
- **OBLIGATORIO**: Usar imports absolutos para archivos de otros módulos
- **OBLIGATORIO**: Agrupar imports: dart, flutter, packages, project
- **OBLIGATORIO**: Ordenar imports alfabéticamente dentro de cada grupo

```dart
// ✅ Correct import organization
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:currency_converter/src/core/core.dart';
import 'package:currency_converter/src/shared/shared.dart';

import '../domain/entities/currency.dart';
import '../domain/repositories/currency_repository.dart';
```

---

## 🎨 Widgets y UI

### Separación de Widgets

#### ❌ PROHIBIDO: Widgets Gigantes
```dart
// ❌ BAD - Widget too large and complex
class CurrencyConversionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Conversion'),
        // ... 50+ lines of code
      ),
      body: Column(
        children: [
          // ... 200+ lines of code with complex logic
          Container(
            // ... more nested code
          ),
        ],
      ),
    );
  }
}
```

#### ✅ OBLIGATORIO: Widgets Pequeños y Enfocados
```dart
// ✅ Good widget structure with English comments
class CurrencyConversionPage extends StatelessWidget {
  const CurrencyConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CurrencyConversionAppBar(),
      body: const CurrencyConversionBody(),
    );
  }
}

// ✅ Separate widgets with specific responsibilities
class CurrencyConversionBody extends StatelessWidget {
  const CurrencyConversionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CurrencyInputSection(),
        SwapButton(),
        ConversionResultSection(),
      ],
    );
  }
}
```

### Reglas para Widgets

1. **Límite de Líneas**: Máximo 100 líneas por widget
2. **Responsabilidad Única**: Cada widget debe tener una sola responsabilidad
3. **Reutilización**: Crear widgets reutilizables cuando sea posible
4. **Composición**: Preferir composición sobre herencia
5. **Const Constructors**: Usar `const` siempre que sea posible
6. **OBLIGATORIO - Clases vs Funciones**: Usar clases en lugar de funciones para crear widgets

#### ❌ PROHIBIDO: Funciones para Widgets
```dart
// ❌ BAD - Using functions to build widgets
Widget _buildHeader() {
  return AppBar(
    title: Text('Currency Converter'),
  );
}

Widget _buildBody() {
  return Column(
    children: [
      // ... widget content
    ],
  );
}
```

#### ✅ OBLIGATORIO: Clases para Widgets
```dart
// ✅ GOOD - Using classes for widgets
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Currency Converter'),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // ... widget content
      ],
    );
  }
}
```

### Nomenclatura de Widgets
- **Páginas**: `[Feature]Page` (ej: `CurrencyConversionPage`)
- **Secciones**: `[Feature]Section` (ej: `CurrencyInputSection`)
- **Componentes**: `[Purpose]Widget` (ej: `AmountInputWidget`)
- **Botones**: `[Action]Button` (ej: `SwapButton`)

---

## 🔄 Gestión de Estado

### BLoC Pattern (Obligatorio)
- **OBLIGATORIO**: Usar BLoC para gestión de estado compleja
- **OBLIGATORIO**: Un BLoC por característica principal
- **OBLIGATORIO**: Eventos inmutables con `equatable`
- **OBLIGATORIO**: Estados inmutables con `equatable`

```dart
// ✅ Correct BLoC structure
abstract class CurrencyConversionEvent extends Equatable {
  const CurrencyConversionEvent();
  
  @override
  List<Object?> get props => [];
}

class ConvertCurrencyRequested extends CurrencyConversionEvent {
  const ConvertCurrencyRequested({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
  });
  
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  
  @override
  List<Object?> get props => [fromCurrency, toCurrency, amount];
}
```

### Estados Recomendados
```dart
abstract class CurrencyConversionState extends Equatable {
  const CurrencyConversionState();
  
  @override
  List<Object?> get props => [];
}

class CurrencyConversionInitial extends CurrencyConversionState {}

class CurrencyConversionLoading extends CurrencyConversionState {}

class CurrencyConversionSuccess extends CurrencyConversionState {
  const CurrencyConversionSuccess({required this.result});
  
  final ConversionResult result;
  
  @override
  List<Object?> get props => [result];
}

class CurrencyConversionError extends CurrencyConversionState {
  const CurrencyConversionError({required this.message});
  
  final String message;
  
  @override
  List<Object?> get props => [message];
}
```

---

## 📝 Nomenclatura y Convenciones

### Archivos y Carpetas
- **Archivos**: `snake_case.dart`
- **Carpetas**: `snake_case`
- **Clases**: `PascalCase`
- **Variables y funciones**: `camelCase`
- **Constantes**: `SCREAMING_SNAKE_CASE`

### Nombres Descriptivos
```dart
// ✅ Good names
class CurrencyConversionBloc extends Bloc<CurrencyConversionEvent, CurrencyConversionState> {}
final currencyRepository = GetIt.instance<CurrencyRepository>();
const double DEFAULT_CONVERSION_AMOUNT = 1.0;

// ❌ Bad names
class CCBloc extends Bloc<CCEvent, CCState> {}
final repo = GetIt.instance<CurrencyRepository>();
const double amt = 1.0;
```

---

## 💬 Comentarios y Documentación

### Comentarios en Inglés
- **OBLIGATORIO**: Todos los comentarios deben estar en inglés
- **OBLIGATORIO**: Documentar clases públicas con `///`
- **OBLIGATORIO**: Explicar lógica compleja con comentarios inline
- **OBLIGATORIO**: Usar terminología técnica estándar en inglés

```dart
/// Repository for handling currency-related operations.
/// 
/// This repository acts as an intermediary between the presentation layer
/// and data sources, implementing business logic for currency conversions
/// and exchange rate retrieval.
abstract class CurrencyRepository {
  /// Gets the list of available currencies for conversion.
  /// 
  /// Returns a list of [Currency] that includes both FIAT currencies
  /// and cryptocurrencies supported by the API.
  Future<Either<Failure, List<Currency>>> getCurrencies();
  
  /// Converts an amount from one currency to another.
  /// 
  /// [fromCurrency] - Source currency code
  /// [toCurrency] - Target currency code  
  /// [amount] - Amount to convert
  /// 
  /// Returns the conversion result or an error if it fails.
  Future<Either<Failure, ConversionResult>> convertCurrency({
    required String fromCurrency,
    required String toCurrency,
    required double amount,
  });
}
```

### TODO Comments
```dart
// TODO(name): Description of the pending task
// FIXME(name): Description of the problem to fix
// HACK(name): Explanation of why this temporary solution is used
```

---

## ⚠️ Manejo de Errores

### Either Pattern (Obligatorio)
```dart
// ✅ Use Either for error handling
Future<Either<Failure, List<Currency>>> getCurrencies() async {
  try {
    final currencies = await _remoteDataSource.getCurrencies();
    return Right(currencies);
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message));
  } on NetworkException catch (e) {
    return Left(NetworkFailure(e.message));
  } catch (e) {
    return Left(UnexpectedFailure(e.toString()));
  }
}
```

### Jerarquía de Excepciones
```dart
// Base exception
abstract class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

// Specific exceptions
class NetworkException extends AppException {
  const NetworkException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message);
}
```

---

## ⚡ Performance y Optimización

### Widgets Const
```dart
// ✅ Use const whenever possible
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Fixed title'),
        SizedBox(height: 16),
      ],
    );
  }
}
```

### Lazy Loading
```dart
// ✅ Use lazy loading for large lists
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ItemWidget(item: items[index]);
  },
)
```

### Evitar Rebuilds Innecesarios
```dart
// ✅ Use BlocBuilder with buildWhen
BlocBuilder<CurrencyBloc, CurrencyState>(
  buildWhen: (previous, current) => 
    previous.selectedCurrency != current.selectedCurrency,
  builder: (context, state) {
    return CurrencySelector(currency: state.selectedCurrency);
  },
)
```

---

## 🧪 Testing

### Estructura de Tests
```
test/
├── unit/
│   ├── data/
│   ├── domain/
│   └── presentation/
├── widget/
└── integration/
```

### Nomenclatura de Tests
```dart
group('CurrencyRepository', () {
  group('getCurrencies', () {
    test('should return list of currencies when call is successful', () async {
      // Arrange
      when(() => mockRemoteDataSource.getCurrencies())
          .thenAnswer((_) async => mockCurrencies);
      
      // Act
      final result = await repository.getCurrencies();
      
      // Assert
      expect(result, equals(Right(mockCurrencies)));
    });
    
    test('should return ServerFailure when ServerException occurs', () async {
      // Arrange
      when(() => mockRemoteDataSource.getCurrencies())
          .thenThrow(const ServerException('Server error'));
      
      // Act
      final result = await repository.getCurrencies();
      
      // Assert
      expect(result, equals(Left(ServerFailure('Server error'))));
    });
  });
});
```

---

## 🔍 Linting y Análisis de Código

### Reglas Obligatorias
- **OBLIGATORIO**: Pasar `flutter analyze` sin errores
- **OBLIGATORIO**: Usar trailing commas en listas y parámetros
- **OBLIGATORIO**: Evitar `cast_nullable_to_non_nullable`
- **OBLIGATORIO**: Usar `prefer_const_constructors` cuando sea posible
- **OBLIGATORIO**: Agregar newline al final de cada archivo

### Configuración Recomendada
```yaml
# analysis_options.yaml
include: package:very_good_analysis/analysis_options.yaml

linter:
  rules:
    # Reglas específicas del proyecto
    prefer_single_quotes: true
    require_trailing_commas: true
    sort_constructors_first: true
    sort_unnamed_constructors_first: true
```

---

## 📚 Recursos Adicionales

### Documentación Oficial
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- [BLoC Library](https://bloclibrary.dev/)

### Herramientas Recomendadas
- **Análisis**: `very_good_analysis`
- **Generación de código**: `build_runner`
- **Inyección de dependencias**: `get_it`
- **Navegación**: `go_router`

---

## ✅ Checklist de Revisión de Código

Antes de hacer commit, verificar:

- [ ] El código pasa `flutter analyze` sin errores
- [ ] Los tests unitarios pasan
- [ ] Los widgets no exceden 100 líneas
- [ ] Se usan const constructors donde es posible
- [ ] Los comentarios están en inglés
- [ ] Se siguen las convenciones de nomenclatura
- [ ] Se maneja correctamente el estado con BLoC
- [ ] Se implementa manejo de errores con Either
- [ ] Los imports están organizados correctamente
- [ ] Hay trailing commas en listas y parámetros

---

**Nota**: Este documento es una guía viva que debe actualizarse conforme evoluciona el proyecto. Todas las reglas marcadas como **OBLIGATORIO** deben cumplirse sin excepción.