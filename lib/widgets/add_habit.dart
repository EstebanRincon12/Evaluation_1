import 'package:evaluacion/widgets/habits.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
    const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Habitos> listHabits=[
      Habitos(days: 10, name: 'HAbito 1'),
      Habitos(days: 10, name: 'HAbito 1'),
      Habitos(days: 10, name: 'HAbito 1'),
      Habitos(days: 10, name: 'HAbito 1'),
      Habitos(days: 10, name: 'HAbito 1'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir a Favoritos'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Text(
                  'Habitos:',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lista de Habitos',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listHabits.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listHabits[index].name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Meta de dias: ${listHabits[index]..days}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


