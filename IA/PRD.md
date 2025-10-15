# Product Requirements Document (PRD)
## Currency Converter App - Eldorado.io Challenge

---

### 1. Overview

#### 1.1 Purpose
Desarrollar una aplicación móvil que permita a los usuarios convertir monedas entre tipos FIAT (monedas tradicionales) y CRYPTO (criptomonedas) utilizando tasas de cambio en tiempo real.

#### 1.2 Scope
Esta aplicación es una prueba técnica para demostrar habilidades de programación en Flutter, diseño UI/UX, y arquitectura de software escalable.

#### 1.3 Target Audience
- Usuarios que necesitan conocer el valor de conversión entre criptomonedas y monedas fiduciarias
- Evaluadores técnicos de Eldorado.io

---

### 2. Product Goals

#### 2.1 Primary Goals
- Proporcionar conversiones precisas y en tiempo real entre FIAT y CRYPTO
- Ofrecer una experiencia de usuario intuitiva y fluida
- Demostrar código limpio, escalable y mantenible

#### 2.2 Success Metrics
- Precisión en las conversiones (100% basado en API)
- Tiempo de respuesta < 2 segundos por conversión
- Interfaz que coincida con el diseño proporcionado en los assets
- Código con arquitectura clara y escalable

---

### 3. User Stories

#### 3.1 Como usuario, quiero:
- **US-01**: Ver una calculadora clara donde pueda ingresar una cantidad de dinero
- **US-02**: Seleccionar la moneda de origen (FIAT o CRYPTO)
- **US-03**: Seleccionar la moneda de destino (CRYPTO o FIAT)
- **US-04**: Ver el resultado de la conversión en tiempo real
- **US-05**: Entender la tasa de cambio actual entre las monedas seleccionadas
- **US-06**: Intercambiar rápidamente la dirección de conversión (swap)
- **US-07**: Ver feedback visual cuando la conversión está cargando
- **US-08**: Recibir mensajes claros en caso de errores

---

### 4. Functional Requirements

#### 4.1 Currency Selection
- **FR-01**: El usuario debe poder seleccionar una moneda FIAT de una lista predefinida
- **FR-02**: El usuario debe poder seleccionar una moneda CRYPTO de una lista predefinida
- **FR-03**: Las monedas deben mostrar su símbolo/icono y nombre
- **FR-04**: Debe existir validación para evitar seleccionar la misma moneda en origen y destino

#### 4.2 Amount Input
- **FR-05**: El usuario debe poder ingresar una cantidad numérica
- **FR-06**: El input debe aceptar números decimales
- **FR-07**: Debe existir validación para montos válidos (> 0)
- **FR-08**: El teclado debe ser numérico para facilitar la entrada

#### 4.3 Conversion Display
- **FR-09**: El resultado de la conversión debe mostrarse claramente
- **FR-10**: La tasa de cambio debe ser visible para el usuario
- **FR-11**: Los valores deben formatearse apropiadamente según el tipo de moneda
- **FR-12**: La conversión debe actualizarse cuando cambia cualquier parámetro

#### 4.4 Swap Functionality
- **FR-13**: Debe existir un botón para intercambiar las monedas (origen ↔ destino)
- **FR-14**: Al hacer swap, la conversión debe recalcularse automáticamente

#### 4.5 Error Handling
- **FR-15**: Mostrar mensaje de error si la API falla
- **FR-16**: Mostrar mensaje si no hay conexión a internet
- **FR-17**: Manejar casos de timeout de la API

---

### 5. Non-Functional Requirements

#### 5.1 Performance
- **NFR-01**: La aplicación debe cargar en menos de 3 segundos
- **NFR-02**: Las conversiones deben completarse en menos de 2 segundos
- **NFR-03**: La aplicación debe ser responsiva y fluida (60 FPS)

#### 5.2 Usability
- **NFR-04**: La interfaz debe ser intuitiva sin necesidad de tutorial
- **NFR-05**: Los elementos interactivos deben tener feedback visual
- **NFR-06**: La aplicación debe seguir las guías de diseño Material Design / Cupertino

#### 5.3 Reliability
- **NFR-07**: La aplicación debe manejar gracefully los errores de red
- **NFR-08**: Debe mostrar estados de carga apropiados

#### 5.4 Maintainability
- **NFR-09**: El código debe seguir principios SOLID
- **NFR-10**: Debe existir separación clara de responsabilidades (arquitectura limpia)
- **NFR-11**: El código debe estar comentado en secciones complejas

---

### 6. UI/UX Requirements

#### 6.1 Design Principles
- Minimalista y limpio
- Jerarquía visual clara
- Feedback inmediato en interacciones
- Consistencia en colores y tipografía

#### 6.2 Key Screens
1. **Main Screen - Calculator**
   - Input de cantidad
   - Selector de moneda origen
   - Botón de swap
   - Selector de moneda destino
   - Display de resultado
   - Display de tasa de cambio

#### 6.3 Interactive Elements
- Botones con estados (normal, pressed, disabled)
- Inputs con validación visual
- Loading indicators
- Animaciones suaves en transiciones

---

### 7. Out of Scope

- Autenticación de usuarios
- Historial de conversiones
- Múltiples conversiones simultáneas
- Modo offline con cache
- Notificaciones
- Gráficos de tendencias de precios
- Integración con wallets

---

### 8. Assumptions

- La API estará disponible durante el desarrollo y evaluación
- Los IDs de las monedas están disponibles en los assets proporcionados
- El diseño final está en los assets del repositorio
- La aplicación requiere conexión a internet para funcionar

---

### 9. Dependencies

- API de Eldorado.io (https://74j6q7lg6a.execute-api.eu-west-1.amazonaws.com)
- Assets proporcionados en el repositorio
- Conexión a internet

---

### 10. Acceptance Criteria

#### Para considerar el proyecto completo:
- ✅ La aplicación compila y ejecuta sin errores
- ✅ Todas las funcionalidades core están implementadas
- ✅ El diseño es similar al proporcionado en los assets
- ✅ El código sigue una arquitectura escalable
- ✅ Manejo apropiado de errores y estados de carga
- ✅ La conversión funciona correctamente en ambas direcciones
- ✅ El código es limpio y mantenible

---

### 11. Timeline

Este es un challenge técnico sin deadline estricto, pero se recomienda:
- **Fase 1**: Setup y estructura del proyecto (2-3 horas)
- **Fase 2**: Implementación de UI (4-5 horas)
- **Fase 3**: Integración con API (2-3 horas)
- **Fase 4**: Testing y refinamiento (2-3 horas)
- **Total estimado**: 10-14 horas de desarrollo

---

### 12. Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-10-13 | Development Team | Initial PRD |

---

**Note**: Este documento está diseñado para el coding challenge de Eldorado.io y puede ser ajustado según feedback durante el desarrollo.