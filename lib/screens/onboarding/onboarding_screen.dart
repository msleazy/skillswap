import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingData> _pages = [
    _OnboardingData(
      icon: Icons.swap_horiz_rounded,
      title: '¡Bienvenido a SkillSwap!',
      description:
          'La plataforma donde los estudiantes intercambian habilidades y conocimientos entre sí.',
      color: const Color(0xFF6C63FF),
    ),
    _OnboardingData(
      icon: Icons.people_rounded,
      title: 'Conecta con Estudiantes',
      description:
          'Publica lo que sabes y encuentra personas con las habilidades que necesitas aprender.',
      color: const Color(0xFF9C27B0),
    ),
    _OnboardingData(
      icon: Icons.rocket_launch_rounded,
      title: 'Crece Juntos',
      description:
          'Programa, diseña, aprende idiomas, música y mucho más intercambiando con tu comunidad universitaria.',
      color: const Color(0xFF48CAE4),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [page.color, page.color.withValues(alpha: 0.7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(page.icon,
                            size: 80, color: Colors.white),
                      ),
                      const SizedBox(height: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          page.title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          page.description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
          // Controles inferiores
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Indicadores de página
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white38,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Botones
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                        ),
                        child: const Text(
                          'Omitir',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 14),
                        ),
                        child: Text(
                          _currentPage == _pages.length - 1
                              ? '¡Comenzar!'
                              : 'Siguiente',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingData {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _OnboardingData({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
