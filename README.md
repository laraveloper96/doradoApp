# 💱 Currency Converter

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Una aplicación móvil moderna para conversión de monedas entre FIAT y CRYPTO, desarrollada con Flutter y integrada con la API de Eldorado.io.

## 📱 Capturas de Pantalla

<div align="center">
  <img src="assets/screen_1.jpg" alt="Pantalla Principal" width="300"/>
  <img src="assets/sheet_1.jpg" alt="Selector de Monedas" width="300"/>
  <img src="assets/sheet_2.jpg" alt="Información de Conversión" width="300"/>
</div>

*Interfaz principal de la aplicación mostrando la conversión de divisas, selector de monedas y detalles de conversión*

---

## 📱 Descripción del Proyecto

**Currency Converter** es una aplicación móvil que permite a los usuarios convertir monedas entre tipos FIAT (monedas tradicionales) y CRYPTO (criptomonedas) utilizando tasas de cambio en tiempo real. La aplicación está desarrollada como parte del desafío técnico de Eldorado.io.

### ✨ Características Principales

- 🔄 **Conversión bidireccional**: FIAT ↔ CRYPTO
- 📊 **Tasas en tiempo real**: Integración con API de Eldorado.io
- 🎨 **UI/UX moderna**: Diseño limpio y intuitivo
- 🏗️ **Arquitectura escalable**: Feature-First Clean Architecture
- 🌐 **Internacionalización**: Soporte para español e inglés
- 📱 **Multiplataforma**: iOS, Android, Web y Windows

### 🪙 Monedas Soportadas

**FIAT (Monedas Fiduciarias):**
- 🇧🇷 BRL (Real Brasileño)
- 🇨🇴 COP (Peso Colombiano)
- 🇵🇪 PEN (Sol Peruano)
- 🇻🇪 VES (Bolívar Venezolano)

**CRYPTO (Criptomonedas):**
- ₮ USDT (Tether)

<div align="center">
  <img src="assets/fiat_currencies/BRL.png" alt="BRL" width="50"/>
  <img src="assets/fiat_currencies/COP.png" alt="COP" width="50"/>
  <img src="assets/fiat_currencies/PEN.png" alt="PEN" width="50"/>
  <img src="assets/fiat_currencies/VES.png" alt="VES" width="50"/>
  <img src="assets/cripto_currencies/TATUM-TRON-USDT.png" alt="USDT" width="50"/>
</div>

---

## 🛠️ Requisitos Previos

Antes de comenzar, asegúrate de tener instalado:

### Herramientas Esenciales

1. **Flutter SDK** (versión 3.24.0 o superior)
   ```bash
   # Verificar instalación
   flutter --version
   ```

2. **FVM (Flutter Version Management)** - Recomendado
   ```bash
   # Instalar FVM globalmente
   dart pub global activate fvm
   ```

3. **Very Good CLI** - Para mejores prácticas
   ```bash
   # Instalar Very Good CLI
   dart pub global activate very_good_cli
   ```

### Entornos de Desarrollo

- **Para iOS**: Xcode 14.0+ (solo en macOS)
- **Para Android**: Android Studio con SDK 21+
- **Para Web**: Chrome o cualquier navegador moderno
- **Para Windows**: Visual Studio 2019+ (solo en Windows)

---

## 🚀 Instalación y Configuración

### 1. Clonar el Repositorio

```bash
git clone <repository-url>
cd doradoApp
```

### 2. Configurar Flutter con FVM

```bash
# Instalar la versión específica de Flutter
fvm install 3.24.0

# Usar la versión en el proyecto
fvm use 3.24.0

# Verificar que FVM está configurado correctamente
fvm flutter --version
```

### 3. Instalar Dependencias

```bash
# Instalar dependencias de Flutter
fvm flutter pub get

# Generar código necesario (modelos, inyección de dependencias, etc.)
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# Generar localizaciones
fvm flutter gen-l10n --arb-dir="lib/l10n/arb"
```

### 4. Configuración de Assets

Los assets ya están incluidos en el proyecto:
- **Iconos de monedas FIAT**: `assets/fiat_currencies/`
- **Iconos de criptomonedas**: `assets/cripto_currencies/`
- **Datos mock**: `assets/mocks/currencies.json`

---

## 🏃‍♂️ Ejecutar la Aplicación

El proyecto incluye 3 flavors (entornos):

### Development (Desarrollo)
```bash
fvm flutter run --flavor development --target lib/main_development.dart
```

### Staging (Pruebas)
```bash
fvm flutter run --flavor staging --target lib/main_staging.dart
```

### Production (Producción)
```bash
fvm flutter run --flavor production --target lib/main_production.dart
```

### Ejecutar en Plataformas Específicas

```bash
# iOS (requiere macOS y Xcode)
fvm flutter run -d ios --flavor development --target lib/main_development.dart

# Android
fvm flutter run -d android --flavor development --target lib/main_development.dart

# Web
fvm flutter run -d chrome --flavor development --target lib/main_development.dart

# Windows (requiere Windows)
fvm flutter run -d windows --flavor development --target lib/main_development.dart
```

---

## 🧪 Testing

### Ejecutar Todos los Tests

```bash
# Tests unitarios y de widgets con cobertura
fvm flutter test --coverage --test-randomize-ordering-seed random
```

### Ver Reporte de Cobertura

```bash
# Generar reporte HTML (requiere lcov)
genhtml coverage/lcov.info -o coverage/

# Abrir reporte en el navegador
open coverage/index.html
```

### Tests por Categoría

```bash
# Solo tests unitarios
fvm flutter test test/unit/

# Solo tests de widgets
fvm flutter test test/widget/

# Tests específicos
fvm flutter test test/features/currency_conversion/
```

---

## 🏗️ Arquitectura del Proyecto

### Feature-First Clean Architecture

```
lib/
├── src/
│   ├── core/                    # Funcionalidades transversales
│   │   ├── constants/           # Constantes de la aplicación
│   │   ├── error/              # Manejo de errores
│   │   ├── network/            # Configuración de red
│   │   └── router/             # Navegación
│   ├── features/               # Características de la aplicación
│   │   └── currency_conversion/ # Feature principal
│   │       ├── data/           # Capa de datos
│   │       ├── domain/         # Lógica de negocio
│   │       └── presentation/   # UI y estado
│   └── shared/                 # Componentes compartidos
│       └── system_design/      # Sistema de diseño
├── app/                        # Configuración de la app
└── l10n/                       # Internacionalización
```

### Stack Tecnológico

- **Framework**: Flutter 3.24.0
- **Gestión de Estado**: flutter_bloc + Cubit
- **Navegación**: go_router
- **HTTP Client**: dio
- **Inyección de Dependencias**: get_it + injectable
- **Generación de Código**: freezed + json_serializable
- **Testing**: flutter_test + bloc_test + mocktail
- **Análisis de Código**: very_good_analysis

---

## 🌐 Internacionalización

### Idiomas Soportados

- 🇪🇸 **Español** (es)
- 🇺🇸 **Inglés** (en)

### Agregar Nuevas Traducciones

1. **Agregar strings en `lib/l10n/arb/app_en.arb`**:
```json
{
    "@@locale": "en",
    "newString": "Hello World",
    "@newString": {
        "description": "A greeting message"
    }
}
```

2. **Agregar traducción en `lib/l10n/arb/app_es.arb`**:
```json
{
    "@@locale": "es",
    "newString": "Hola Mundo",
    "@newString": {
        "description": "Un mensaje de saludo"
    }
}
```

3. **Generar traducciones**:
```bash
fvm flutter gen-l10n --arb-dir="lib/l10n/arb"
```

4. **Usar en el código**:
```dart
Text(context.l10n.newString)
```

---

## 🔧 Comandos Útiles

### Desarrollo

```bash
# Limpiar proyecto
fvm flutter clean && fvm flutter pub get

# Generar código
fvm flutter packages pub run build_runner build --delete-conflicting-outputs

# Analizar código
fvm flutter analyze

# Formatear código
fvm flutter format .

# Verificar dependencias
fvm flutter pub deps
```

### Build

```bash
# Build para Android (APK)
fvm flutter build apk --flavor production --target lib/main_production.dart

# Build para Android (App Bundle)
fvm flutter build appbundle --flavor production --target lib/main_production.dart

# Build para iOS
fvm flutter build ios --flavor production --target lib/main_production.dart

# Build para Web
fvm flutter build web --flavor production --target lib/main_production.dart
```

---

## 🐛 Solución de Problemas

### Problemas Comunes

1. **Error de dependencias**:
   ```bash
   fvm flutter clean
   fvm flutter pub get
   fvm flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **Error de FVM**:
   ```bash
   fvm install 3.24.0
   fvm use 3.24.0
   ```

3. **Error de generación de código**:
   ```bash
   fvm flutter packages pub run build_runner clean
   fvm flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Error de localización**:
   ```bash
   fvm flutter gen-l10n --arb-dir="lib/l10n/arb"
   ```

### Logs y Debugging

```bash
# Ejecutar con logs detallados
fvm flutter run --verbose

# Ver logs en tiempo real
fvm flutter logs

# Analizar rendimiento
fvm flutter run --profile
```

---

## 📚 Documentación Adicional

### Documentos del Proyecto

- 📋 **[PRD.md](IA/PRD.md)**: Requerimientos del producto
- 🔧 **[TRD.md](IA/TRD.md)**: Requerimientos técnicos
- 🎨 **[system_design_documentation.md](IA/system_design_documentation.md)**: Sistema de diseño
- 📈 **[TASKS_PROGRESS.md](IA/TASKS_PROGRESS.md)**: Progreso de tareas
- 🎨 **[design_colors.md](IA/design_colors.md)**: Paleta de colores y sistema de diseño "Moto Leniador"

### API de Eldorado.io

**Base URL**: `https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com`

**Endpoints**:
- `GET /currencies` - Obtener lista de monedas
- `GET /exchange-rate` - Obtener tasa de cambio
- `POST /convert` - Realizar conversión

---

## 🤝 Contribución

### Flujo de Desarrollo

1. **Fork** del repositorio
2. **Crear** una rama para tu feature: `git checkout -b feature/nueva-funcionalidad`
3. **Commit** tus cambios: `git commit -m 'Agregar nueva funcionalidad'`
4. **Push** a la rama: `git push origin feature/nueva-funcionalidad`
5. **Crear** un Pull Request

### Estándares de Código

- Seguir las reglas de **very_good_analysis**
- Mantener cobertura de tests > 85%
- Documentar funciones públicas
- Usar **Conventional Commits**

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 👥 Equipo

Desarrollado como parte del desafío técnico de **Eldorado.io**.

---

## 📞 Soporte

Si tienes problemas o preguntas:

1. Revisa la [documentación](#-documentación-adicional)
2. Consulta los [problemas comunes](#-solución-de-problemas)
3. Crea un issue en el repositorio

---

**¡Gracias por usar Currency Converter! 🚀**

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
