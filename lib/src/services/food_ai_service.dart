import 'dart:io';
import 'dart:math';

class FoodAnalysis {
  final String label;
  final int calories;
  final double confidence;

  const FoodAnalysis({
    required this.label,
    required this.calories,
    required this.confidence,
  });
}

class FoodAIService {
  // список нескольких примеров блюд
  static const _samples = [
    ('Burger', 354),
    ('Pizza', 266),
    ('Salad', 110),
    ('Sushi', 205),
    ('Pasta', 310),
  ];

  Future<FoodAnalysis> analyze(File image) async {
    // Имитация долгого расчёта
    await Future.delayed(const Duration(seconds: 2));

    final rnd = Random();
    final sample = _samples[rnd.nextInt(_samples.length)];

    return FoodAnalysis(
      label: sample.$1,
      calories: sample.$2,
      confidence: (0.6 + rnd.nextDouble() * 0.4), // 0.6‒1.0
    );
  }
}