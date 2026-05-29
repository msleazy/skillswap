class AppConstants {
  // Nombre de la app
  static const String appName = 'SkillSwap';
  static const String appTagline = 'Intercambia habilidades, crece junto';

  // Colecciones de Firestore
  static const String usersCollection = 'users';
  static const String postsCollection = 'posts';
  static const String categoriesCollection = 'categories';

  // Categorías disponibles
  static const List<String> categories = [
    'Programación',
    'Diseño',
    'Música',
    'Gym',
    'Idiomas',
    'Matemáticas',
    'Arte',
    'Fotografía',
  ];

  // Planes premium
  static const List<String> premiumPlans = ['Básico', 'Pro', 'Elite'];
}
