# Mi Consumo Bar

Aplicación iOS para registrar consumiciones personales de bebidas en bares.

## 📱 Características

- Conteo de bebidas por tipo
- Registro automático de timestamp
- Input de precios individuales  
- Historial cronológico
- Cálculo de totales en tiempo real
- Persistencia local con Core Data

## 🏗️ Arquitectura

- **Swift + SwiftUI**: UI nativa moderna
- **MVVM**: Separación de responsabilidades
- **Core Data**: Persistencia local
- **@Observable**: Estado reactivo (iOS 17+)

## 📁 Estructura del Proyecto

```
MiConsumoBar/
├── App/
│   ├── MiConsumoBarApp.swift          # Entry point
│   └── PersistenceController.swift    # Core Data setup
├── Models/
│   ├── Bebida.swift                  # Bebida entity
│   ├── Consumicion.swift             # Consumicion entity
│   └── CoreDataManager.swift         # Data operations
├── Views/
│   ├── ContentView.swift              # Main view
│   ├── BebidaCounterCard.swift       # Counter component
│   ├── HistorialView.swift           # History view
│   ├── AddConsumicionView.swift      # Add consumption form
│   └── ConsumicionRowView.swift      # History row component
├── ViewModels/
│   ├── ConsumicionViewModel.swift    # Main business logic
│   └── BebidaListViewModel.swift     # Beverages management
├── Services/                         # (Future: notifications)
├── Resources/
│   ├── Info.plist                   # App configuration
│   └── Assets.xcassets/             # Images and icons
└── MiConsumoBar.xcdatamodeld/        # Core Data model
```

## 🔧 Compilación y Ejecución

### Requisitos
- Xcode 15.0+
- iOS 15.0+ target
- Swift 5.9+

### Pasos para compilar

1. **Abrir el proyecto en Xcode**
   ```bash
   # Este proyecto necesita ser abierto como proyecto Xcode
   # Importar todos los archivos en un nuevo proyecto Xcode
   ```

2. **Configurar el Core Data Model**
   - Crear archivo `MiConsumoBar.xcdatamodeld` en Xcode
   - Añadir entidades: Bebida y Consumicion
   - Importar el contenido del modelo XML proporcionado

3. **Ajustar imports y referencias**
   - Asegurar que todos los archivos estén en el target
   - Verificar imports de CoreData y SwiftUI

4. **Build y Run**
   ```bash
   # Desde Xcode:
   # Cmd + B para compilar
   # Cmd + R para ejecutar en simulador
   ```

## 🎯 Uso Básico

1. **Añadir consumición**: Toca el botón + en cualquier bebida
2. **Ver totales**: Header principal muestra cantidad y coste del día
3. **Historial**: Botón "Historial" para ver consumiciones pasadas
4. **Añadir personalizado**: Botón "Añadir Consumición" para bebidas específicas

## 📊 Datos Predefinidos

La app incluye automáticamente:
- 🍺 Cerveza (€3.50)
- 🥤 Refresco (€2.00) 
- 💧 Agua (€1.50)
- 🍷 Vino (€4.00)
- 🍸 Copa (€6.00)
- ☕ Café (€1.80)

## 🔄 Flujo de Datos

```
User Action → ViewModel → CoreDataManager → Core Data → UI Update
```

## 🧪 Testing

### Tests Manuales
- [ ] Añadir/quitar consumiciones
- [ ] Verificar totales en tiempo real
- [ ] Navegar historial por fechas
- [ ] Editar precios y cantidades
- [ ] Persistencia de datos

### Tests Unitarios (por implementar)
- Core Data operations
- ViewModel business logic
- Calculations and validations

## 🚀 Mejoras Futuras

- [ ] Widgets para iOS 14+
- [ ] Siri Shortcuts para añadir rápidamente
- [ ] Exportación a CSV
- [ ] Gráficos con Swift Charts
- [ ] Notificaciones de consumo
- [ ] sincronización iCloud

## 🐛 Problemas Conocidos

- Los errores de compilación actuales son por falta de configuración Xcode
- Core Data entities necesitan ser generadas desde el modelo .xcdatamodeld
- Algunas referencias cruzadas necesitan configuración de target

## 📝 Notas de Desarrollo

Este proyecto fue creado manualmente fuera de Xcode. Para una compilación exitosa:

1. Crear nuevo proyecto Xcode "App" con SwiftUI
2. Importar/copiados todos los archivos creados
3. Configurar Core Data model manualmente en Xcode
4. Asegurar que todos los archivos estén incluidos en el target

## 📄 Licencia

MIT License - Código abierto para uso personal y educacional.