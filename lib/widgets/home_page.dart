import 'package:evaluacion/widgets/add.dart';
import 'package:evaluacion/widgets/add_day.dart';
import 'package:evaluacion/widgets/habits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Habitos> listHabits = [
    Habitos(days: 0, name: 'Hábito 1'),
    Habitos(days: 0, name: 'Hábito 2'),
    Habitos(days: 0, name: 'Hábito 3'),
    Habitos(days: 0, name: 'Hábito 4'),
    Habitos(days: 0, name: 'Hábito 5'),
  ];

  void updateDays(int index) {
    setState(() {
      listHabits[index].days += 1; // Incrementar los días en 1
    });
  }
  void resetDays(int index) {
    setState(() {
      listHabits[index].days = 0; // Reiniciar los días a 0
    });
  }

  @override
  Widget build(BuildContext context) {
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
      return GestureDetector(
        onTap: () {
          // Pasar las acciones para los botones "Sí" y "No"
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return AddDay(
                onYesPressed: () {
                  updateDays(index); // Incrementa los días
                  Navigator.pop(context); // Cierra el modal
                },
                onNoPressed: () {
                  resetDays(index); // Reinicia los días a 0
                  Navigator.pop(context); // Cierra el modal
                },
              );
            },
          );
        },
        child: Card(
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
                        'Meta de días: ${listHabits[index].days}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
)

        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.place, color: Colors.white),
            label: 'Añadir Habito',
            backgroundColor: Colors.yellow,
            onTap: () {
              //Aca
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // Permite que el modal ocupe más espacio
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return const Add();
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.favorite_border, color: Colors.white),
            label: 'Eliminar de Habito',
            backgroundColor: Colors.red,
            onTap: () {
              print('Eliminar de Favoritos');
            },
          ),
        ],
      ),
    );
  }
}

