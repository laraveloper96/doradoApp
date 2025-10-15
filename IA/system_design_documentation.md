# Sistema de Diseño - Currency Converter

## Descripción General

Este documento describe el sistema de diseño implementado para la aplicación Currency Converter (Moto Leniador). El sistema está organizado en cuatro componentes principales que proporcionan una base sólida y consistente para toda la interfaz de usuario.

## Estructura del Sistema

```
lib/src/shared/system_design/
├── colors/
│   ├── app_colors.dart          # Paleta de colores principal
│   └── color_extensions.dart    # Extensiones para acceso fácil a colores
├── spacing/
│   └── app_spacing.dart         # Sistema de espaciado consistente
├── theme/
│   ├── app_theme.dart           # Configuración de temas Material 3
│   └── theme_extensions.dart    # Extensiones para acceso a temas
└── typography/
    ├── app_text_styles.dart     # Estilos de texto estandarizados
    └── text_extensions.dart     # Extensiones y utilidades de texto
```

## 1. Colores (`colors/`)

### AppColors (`app_colors.dart`)

Define la paleta de colores completa de la aplicación basada en la identidad visual de Moto Leniador.

#### Colores Principales
- **Primary**: Dorado (#FFD700) - Color principal de la marca
- **Secondary**: Naranja (#FF8C00) - Color secundario complementario
- **Tertiary**: Verde oliva (#8FBC8F) - Color terciario para acentos

#### Colores de Texto
- **textPrimary**: Negro suave para texto principal
- **textSecondary**: Gris medio para texto secundario
- **textOnLight**: Texto sobre fondos claros
- **textOnDark**: Texto sobre fondos oscuros
- **textLink**: Color para enlaces
- **textPrice**: Color específico para precios

#### Colores de Estado
- **successGreen**: Verde para estados exitosos
- **warningYellow**: Amarillo para advertencias
- **errorRed**: Rojo para errores
- **infoBlue**: Azul para información

#### Colores Específicos de la App
- **Mapas**: Marcadores, ubicación actual, rutas
- **Estados de pedidos**: Pendiente, en progreso, entregado, cancelado
- **Botones**: Primario, secundario, deshabilitado
- **Formularios**: Bordes, fondos, placeholders

#### Utilidades
- Conversión a hexadecimal
- Métodos para aclarar/oscurecer colores
- Combinaciones accesibles (WCAG AA)
- Gradientes predefinidos

### ColorExtensions (`color_extensions.dart`)

Proporciona acceso fácil a los colores desde cualquier widget a través de extensiones de `BuildContext`.

```dart
// Uso en widgets
context.colors.primary
context.colors.success
context.colorScheme.surface
```

## 2. Espaciado (`spacing/`)

### AppSpacing (`app_spacing.dart`)

Sistema de espaciado basado en múltiplos de 2px para mantener consistencia visual.

#### Espaciado Base
- **s1**: 2px - Espaciado mínimo
- **s2**: 4px - Espaciado muy pequeño
- **s3**: 8px - Espaciado pequeño
- **s4**: 12px - Espaciado pequeño-medio
- **s5**: 16px - Espaciado medio (más usado)
- **s6**: 20px - Espaciado medio-grande
- **s7**: 24px - Espaciado grande
- **s8**: 32px - Espaciado muy grande
- **s9**: 40px - Espaciado extra grande
- **s10**: 48px - Espaciado XXL
- **s11**: 56px - Espaciado XXXL
- **s12**: 64px - Espaciado máximo

#### Espaciado Contextual
- **listItem**: 16px - Entre elementos de lista
- **section**: 32px - Entre secciones
- **card**: 16px - Para tarjetas
- **button**: 8px - Para botones
- **input**: 16px - Para formularios
- **navigation**: 24px - Para navegación
- **content**: 16px - Para contenido principal
- **header**: 24px - Para encabezados

#### Utilidades de Espaciado
- **Vertical/Horizontal**: Widgets SizedBox predefinidos
- **Responsive**: Espaciado adaptativo según tamaño de pantalla
- **Custom**: Espaciado personalizado basado en múltiplos

```dart
// Uso en widgets
AppSpacing.vertical.s5  // SizedBox vertical de 16px
AppSpacing.horizontal.s3  // SizedBox horizontal de 8px
AppSpacing.responsive(context)  // Espaciado adaptativo
```

## 3. Tipografía (`typography/`)

### AppTextStyles (`app_text_styles.dart`)

Define todos los estilos de texto siguiendo las especificaciones de Material Design 3.

#### Estilos Display
- **displayLarge**: 57px - Títulos principales, splash screens
- **displayMedium**: 45px - Títulos de sección importantes
- **displaySmall**: 36px - Títulos de tarjetas principales

#### Estilos Headline
- **headlineLarge**: 32px - Títulos de página, headers principales
- **headlineMedium**: 28px - Subtítulos importantes, nombres de servicios
- **headlineSmall**: 24px - Títulos de sección, categorías

#### Estilos Title
- **titleLarge**: 22px - Títulos de diálogos, nombres de productos/servicios
- **titleMedium**: 16px - Subtítulos, nombres de elementos
- **titleSmall**: 14px - Títulos de componentes pequeños

#### Estilos Body
- **bodyLarge**: 16px - Texto principal, descripciones importantes
- **bodyMedium**: 14px - Texto general, contenido estándar
- **bodySmall**: 12px - Texto secundario, metadatos

#### Estilos Label
- **labelLarge**: 14px - Etiquetas de botones, tabs
- **labelMedium**: 12px - Etiquetas de campos, chips
- **labelSmall**: 11px - Etiquetas pequeñas, badges

#### Estilos Específicos Moto Leniador
- **trackingCode**: Estilo para códigos de seguimiento
- **price**: Estilo para precios
- **currency**: Estilo para símbolos de moneda

### TextExtensions (`text_extensions.dart`)

Proporciona extensiones y utilidades para trabajar con texto de manera más eficiente.

#### Extensiones de BuildContext
```dart
context.textStyles.headlineLarge  // Acceso directo a estilos
context.textStyles.bodyMedium.colored(Colors.red)  // Con color
```

#### Extensiones de TextStyle
```dart
AppTextStyles.bodyLarge.bold()  // Texto en negrita
AppTextStyles.titleMedium.italic()  // Texto en cursiva
```

#### Constructor de Estilos (TextStyleBuilder)
```dart
TextStyleBuilder()
  .color(Colors.blue)
  .size(18)
  .weight(FontWeight.bold)
  .build()
```

## 4. Temas (`theme/`)

### AppTheme (`app_theme.dart`)

Configuración completa de temas Material 3 para modo claro y oscuro.

#### Características Principales
- **Material 3**: Implementación completa del sistema de diseño
- **Modo Claro/Oscuro**: Soporte completo para ambos temas
- **ColorScheme**: Esquemas de color adaptativos
- **Componentes**: Configuración de todos los componentes Material

#### Componentes Configurados
- AppBar, Buttons (Elevated, Text, Outlined, Filled)
- Input Decoration, Cards, Dialogs
- Bottom Sheets, Navigation Bars
- Chips, Dividers, FAB, Icons
- List Tiles, Progress Indicators
- Switches, Checkboxes, Radio Buttons
- Tab Bars, Tooltips

### ThemeExtensions (`theme_extensions.dart`)

Extensiones que facilitan el acceso a elementos del tema desde cualquier widget.

#### Extensiones de BuildContext
```dart
context.theme  // Acceso al tema actual
context.colorScheme  // Esquema de colores
context.textTheme  // Tema de texto
context.isDarkMode  // Verificar modo oscuro
context.appColors  // Colores del sistema de diseño
context.appTextStyles  // Estilos de texto adaptativos
context.appSpacing  // Espaciado del sistema
```

#### Colores Adaptativos
Los colores se adaptan automáticamente al tema actual (claro/oscuro):
- Colores principales del esquema
- Colores de texto adaptativos
- Colores de entrada/formularios
- Colores de botones
- Colores específicos de la app

## Uso del Sistema de Diseño

### Implementación en Widgets

```dart
class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.content),
      decoration: BoxDecoration(
        color: context.appColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Título Principal',
            style: context.appTextStyles.headlineMedium,
          ),
          AppSpacing.vertical.s3,
          Text(
            'Descripción del contenido',
            style: context.appTextStyles.bodyMedium.copyWith(
              color: context.appColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
```

### Configuración en la App

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // ... resto de la configuración
    );
  }
}
```

## Beneficios del Sistema

1. **Consistencia**: Todos los elementos visuales siguen las mismas reglas
2. **Mantenibilidad**: Cambios centralizados se propagan automáticamente
3. **Escalabilidad**: Fácil agregar nuevos componentes siguiendo el sistema
4. **Accesibilidad**: Colores y contrastes que cumplen estándares WCAG
5. **Responsive**: Adaptación automática a diferentes tamaños de pantalla
6. **Temas**: Soporte nativo para modo claro y oscuro

## Mejores Prácticas

1. **Usar siempre el sistema**: Evitar valores hardcodeados
2. **Extensiones de contexto**: Preferir `context.appColors` sobre `AppColors`
3. **Espaciado consistente**: Usar los valores predefinidos de `AppSpacing`
4. **Estilos de texto**: Usar los estilos predefinidos y adaptarlos según necesidad
5. **Colores adaptativos**: Usar colores que se adapten al tema actual
6. **Testing**: Probar en ambos temas (claro y oscuro)

## Futuras Mejoras

1. **Animaciones**: Sistema de animaciones consistente
2. **Iconografía**: Biblioteca de iconos personalizada
3. **Componentes**: Componentes reutilizables específicos de la app
4. **Tokens de diseño**: Integración con herramientas de design tokens
5. **Documentación visual**: Storybook o similar para mostrar componentes