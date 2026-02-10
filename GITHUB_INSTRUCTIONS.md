# Instrucciones para Subir a GitHub

## 🎯 Paso a Paso Completo

### 1. Crea tu repositorio en GitHub
- Ve a: https://github.com/new
- Nombre: `mi-consumo-bar` 
- Descripción: `App iOS para registrar consumiciones personales de bebidas`
- Tipo: Público o Privado (tu preferencia)
- ❌ NO marques "Add a README file"
- ❌ NO marques "Add .gitignore" 
- ✅ Puedes marcar "Add a license" (opcional)

### 2. Una vez creado, copia la URL HTTPS
Será algo como: `https://github.com/TU_USERNAME/mi-consumo-bar.git`

### 3. Ejecuta estos comandos en tu terminal:

```bash
# Reemplaza TU_USERNAME con tu username real
cd /Users/clot/Desktop/contador/MiConsumoBar

# Añadir remoto (reemplaza TU_USERNAME)
git remote add origin https://github.com/TU_USERNAME/mi-consumo-bar.git

# Renombrar branch a main
git branch -M main

# Subir código a GitHub
git push -u origin main
```

### 4. Verifica en GitHub
- Tu código aparecerá en: https://github.com/TU_USERNAME/mi-consumo-bar
- Verás todos los archivos con el commit inicial

## 🔧 Si tienes problemas con contraseña

Si usas contraseña en lugar de token, GitHub te pedirá un Personal Access Token:

1. Ve a GitHub → Settings → Developer settings → Personal access tokens
2. Generate new token → clásico
3. Selecciona permisos: `repo` (completo)
4. Copia el token (no se vuelve a mostrar)
5. En terminal: `git push -u origin main`
6. Username: tu username
7. Password: tu token (no tu contraseña)

## 📱 Verificar el Repositorio

Una vez subido, tu repositorio debería mostrar:
- ✅ 12 archivos Swift
- ✅ README.md completo
- ✅ .gitignore para iOS
- ✅ Estructura de carpetas organizada
- ✅ Commit inicial con descripción detallada

## 🎉 ¡Listo!

Tu app "Mi Consumo Bar" estará disponible para:
- Descargar y compilar
- Compartir con otros desarrolladores
- Hacer colaboraciones
- Desplegar futuras mejoras

---

**¿Necesitas ayuda con algún paso específico?**