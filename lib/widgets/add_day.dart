import 'package:flutter/material.dart';

class AddDay extends StatelessWidget {
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  const AddDay({super.key, required this.onYesPressed, required this.onNoPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '¿Cumpliste con el hábito hoy?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  onYesPressed(); // Llama la función para incrementar los días
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Sí'),
              ),
              ElevatedButton(
                onPressed: () {
                  onNoPressed(); // Llama la función para reiniciar los días a 0
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('No'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
