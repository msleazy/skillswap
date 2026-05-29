import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  String? get errorMessage => _errorMessage;

  // Inicializar — escuchar cambios de autenticación
  void initialize() {
    _authService.authStateChanges.listen((firebaseUser) async {
      if (firebaseUser != null) {
        final userData = await _authService.getUserData(firebaseUser.uid);
        _user = userData;
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }

  // Login con Google
  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _authService.signInWithGoogle();

    if (result != null) {
      _user = result;
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'No se pudo iniciar sesión. Intenta de nuevo.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
