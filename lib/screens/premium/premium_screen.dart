import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Planes Premium')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(Icons.workspace_premium, color: Colors.white, size: 48),
                  SizedBox(height: 12),
                  Text(
                    'Desbloquea todo tu potencial',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Elige el plan que mejor se adapte a ti',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Cards de planes
            _PlanCard(
              name: 'Básico',
              price: 'Gratis',
              color: Colors.grey,
              features: const [
                '5 publicaciones por mes',
                'Ver todas las habilidades',
                'Contactar 3 usuarios',
              ],
              isCurrentPlan: true,
            ),
            const SizedBox(height: 16),
            _PlanCard(
              name: 'Pro',
              price: '\$49/mes',
              color: AppColors.primary,
              features: const [
                'Publicaciones ilimitadas',
                'Contactar usuarios ilimitados',
                'Badge Pro en tu perfil',
                'Prioridad en búsquedas',
              ],
              isPopular: true,
            ),
            const SizedBox(height: 16),
            _PlanCard(
              name: 'Elite',
              price: '\$99/mes',
              color: Colors.amber.shade700,
              features: const [
                'Todo lo de Pro',
                'Sesiones de mentoría',
                'Soporte prioritario 24/7',
                'Badge Elite exclusivo',
                'Estadísticas avanzadas',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String name;
  final String price;
  final Color color;
  final List<String> features;
  final bool isCurrentPlan;
  final bool isPopular;

  const _PlanCard({
    required this.name,
    required this.price,
    required this.color,
    required this.features,
    this.isCurrentPlan = false,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isPopular
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header del plan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (isPopular)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Popular',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                if (isCurrentPlan)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Actual',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
          // Features
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ...features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: color, size: 20),
                          const SizedBox(width: 10),
                          Text(f,
                              style: const TextStyle(
                                  color: AppColors.textPrimary)),
                        ],
                      ),
                    )),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isCurrentPlan
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '¡Plan $name seleccionado! (Simulación)'),
                                backgroundColor: color,
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCurrentPlan ? Colors.grey : color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      isCurrentPlan ? 'Plan Actual' : 'Seleccionar $name',
                      style: const TextStyle(color: Colors.white),
                    ),
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
