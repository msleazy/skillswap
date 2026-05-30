# SkillSwap 🔄

> Plataforma móvil/web para intercambio de habilidades entre estudiantes universitarios.

![Flutter](https://img.shields.io/badge/Flutter-3.44.0-blue?logo=flutter)
![Firebase](https://img.shields.io/badge/Firebase-Firestore-orange?logo=firebase)
![Dart](https://img.shields.io/badge/Dart-3.12.0-blue?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

## 📱 Descripción

SkillSwap es una aplicación multiplataforma desarrollada con **Flutter y Firebase** que permite a estudiantes universitarios publicar habilidades que dominan y conectar con otros estudiantes interesados en intercambiarlas.

**Problema que resuelve:** Muchos estudiantes tienen habilidades valiosas (programación, diseño, música, idiomas, etc.) pero no existe una plataforma universitaria sencilla para conectarlos entre sí.

## ✨ Funcionalidades

- 🔐 **Autenticación con Google** — Login seguro con cuenta universitaria
- 📝 **Publicaciones** — Crea y explora ofertas de habilidades en tiempo real
- 🏷️ **Categorías** — Filtra por Programación, Diseño, Música, Gym, Idiomas y más
- 👤 **Perfil de usuario** — Avatar de Google, información personal y plan actual
- ⭐ **Planes Premium** — Básico, Pro y Elite con diferentes beneficios
- 🎯 **Onboarding** — Introducción de 3 pantallas para nuevos usuarios
- 📱 **Responsive** — Funciona en móvil y web

## 🛠️ Stack Tecnológico

| Tecnología | Uso |
|---|---|
| Flutter 3.44 | Framework multiplataforma |
| Firebase Auth | Autenticación con Google |
| Cloud Firestore | Base de datos en tiempo real |
| Firebase Storage | Almacenamiento de imágenes |
| Firebase Messaging | Notificaciones push |
| Provider | Manejo de estado |
| Cached Network Image | Caché de imágenes offline |

## 🏗️ Arquitectura
lib/
├── core/           # Tema, colores, constantes, rutas
├── models/         # UserModel, PostModel
├── providers/      # AuthProvider (estado global)
├── services/       # AuthService, FirestoreService
├── screens/        # Pantallas de la app
│   ├── auth/       # Login
│   ├── home/       # Home principal
│   ├── onboarding/ # Introducción
│   ├── posts/      # Crear publicación
│   ├── profile/    # Perfil de usuario
│   └── premium/    # Planes de suscripción
└── widgets/        # PostCard, CategoryChip

## 🚀 Instalación

### Requisitos
- Flutter 3.19+
- Dart 3.3+
- Firebase CLI
- Android Studio / VS Code

### Pasos

```bash
# Clonar el repositorio
git clone https://github.com/msleazy/skillswap.git
cd skillswap

# Instalar dependencias
flutter pub get

# Configurar Firebase (requiere acceso al proyecto)
flutterfire configure --project=skillswap-4b3ea

# Correr la app
flutter run
```

## 📸 Screenshots

> Próximamente

## 👨‍💻 Desarrollador

**Mariano** — Proyecto universitario

## 📄 Licencia

MIT License — libre para uso educativo.
