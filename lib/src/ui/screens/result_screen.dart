// result_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/food_ai_service.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  File? _file;
  Future<FoodAnalysis>? _future;
  bool _initialized = false;        // чтобы выполнять код только один раз

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      _file = GoRouterState.of(context).extra as File?;
      if (_file != null) {
        _future = FoodAIService().analyze(_file!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: _file == null
          ? const Center(child: Text('No image'))
          : FutureBuilder<FoodAnalysis>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.file(_file!, height: 250, fit: BoxFit.cover),
              const SizedBox(height: 24),
              Text(
                data.label,
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Calories: ${data.calories} kcal',
                  style: const TextStyle(fontSize: 20)),
              Text(
                  'Confidence: ${(data.confidence * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );
  }
}