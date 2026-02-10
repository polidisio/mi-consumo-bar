# 📱 Guía: Importar Mi Consumo Bar a Xcode

## 🎯 Pasos Detallados

### 1. Crear Nuevo Proyecto Xcode
1. Abre Xcode
2. **File → New → Project...**
3. Selecciona **iOS → App**
4. Haz clic en **Next**

### 2. Configurar Proyecto
- **Product Name**: `MiConsumoBar`
- **Team**: Tu Apple ID (o None para desarrollo)
- **Organization Identifier**: `com.polidisio` (o tu preferencia)
- **Bundle Identifier**: `com.polidisio.MiConsumoBar`
- **Language**: **Swift**
- **Interface**: **SwiftUI**
- **Use Core Data**: ✅ **MARCAR ESTA CASILLA**
- **Include Tests**: ❌ (puedes marcarla si quieres)
- Haz clic en **Next**
- Guarda en tu escritorio o carpeta de proyectos

### 3. Configurar Core Data Model
1. En el navegador de proyectos, busca `MiConsumoBar.xcdatamodeld`
2. Haz doble clic para abrir el editor
3. **Añadir Entidad Bebida**:
   - Click "+" para añadir entidad
   - Nombre: `Bebida`
   - Atributos:
     - `id` (UUID)
     - `nombre` (String)  
     - `emoji` (String)
     - `precioBase` (Double)
     - `categoria` (String)
     - `orden` (Int32)

4. **Añadir Entidad Consumicion**:
   - Click "+" para añadir entidad
   - Nombre: `Consumicion`
   - Atributos:
     - `id` (UUID)
     - `bebidaID` (UUID)
     - `cantidad` (Int32)
     - `precioUnitario` (Double)
     - `timestamp` (Date)
     - `notas` (String, opcional)

### 4. Copiar Archivos del Proyecto
1. Abre Finder y ve a: `/Users/clot/Desktop/contador/MiConsumoBar/`
2. Arrastra las carpetas al proyecto Xcode:
   - `App/` folder
   - `Models/` folder (excluyendo el .xcdatamodeld)
   - `Views/` folder
   - `ViewModels/` folder
   - `Resources/` folder
3. En el diálogo que aparece:
   - ✅ **Copy items if needed**
   - ✅ **Create groups**
   - ✅ **MiConsumoBar target** seleccionado
4. Haz clic en **Finish**

### 5. Reemplazar Archivos Generados
1. **Borra o reemplaza** estos archivos generados por Xcode:
   - `ContentView.swift` (reemplaza con nuestro ContentView)
   - `MiConsumoBarApp.swift` (reemplaza con el nuestro)
   - `PersistenceController.swift` (reemplaza con el nuestro)

### 6. Configurar Target
1. Selecciona el proyecto en el navegador
2. Ve a **Build Settings → Search Paths**
3. En **Framework Search Paths**, asegúrate que incluye las rutas correctas

### 7. Build y Run
1. **Cmd + B** para compilar
2. **Cmd + R** para ejecutar en simulador
3. Selecciona un simulador iOS (iPhone 15/14 Pro)

## 🐛 Posibles Errores y Soluciones

### Error: "Cannot find type 'Bebida'"
**Solución**: Asegúrate que el Core Data model está configurado correctamente

### Error: "Use of unresolved identifier 'PersistenceController'"
**Solución**: Verifica que el archivo está en el target

### Error: "SwiftUI/AppKit import mismatch"
**Solución**: Asegúrate que el target es iOS, no macOS

### Error: "Core Data entity not found"
**Solución**: Revisa los nombres exactos en el .xcdatamodeld

## 🧪 Verificación Final
Una vez compilado, deberías ver:
- ✅ App inicia sin errores
- ✅ Bebidas predefinidas cargadas (6 tipos)
- ✅ Contadores funcionan (+/- botones)
- ✅ Totales en tiempo real
- ✅ Historial accesible

## 🚀 ¡Listo para Probar!

Si todo funciona correctamente:
1. Añade consumiciones con el botón +
2. Verifica que los totales se actualizan
3. Prueba el historial
4. Añade consumiciones personalizadas

## 📞 ¿Necesitas Ayuda?
Si encuentras algún error específico, copia y pega el mensaje de error y te ayudaré a solucionarlo.