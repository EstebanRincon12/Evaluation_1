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
    Habitos(days: 20, name: 'Hábito 1'),
    Habitos(days: 0, name: 'Hábito 2'),
    Habitos(days: 0, name: 'Hábito 3'),
    Habitos(days: 0, name: 'Hábito 4'),
    Habitos(days: 0, name: 'Hábito 5'),
  ];

  void updateDays(int index) {
    setState(() {
      listHabits[index].days += 1; 
      if (listHabits[index].days == 21) {
        _showCompletionDialog(index); 
      }
    });
  }

  void resetDays(int index) {
    setState(() {
      listHabits[index].days = 0; 
    });
  }

  void _showCompletionDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Felicidades!'),
          content: const Text('Cumpliste la meta de 21 días.'),
          actions: [
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                setState(() {
                  listHabits.removeAt(index); 
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

   void _addHabit(String habitName) {
    setState(() {
      listHabits.add(Habitos(days: 0, name: habitName)); 
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
                  'Hábitos:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lista de Hábitos',
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
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (BuildContext context) {
                        return AddDay(
                          onYesPressed: () {
                            Navigator.pop(context); 
                            updateDays(index); 
                          },
                          onNoPressed: () {
                            resetDays(index);
                            Navigator.pop(context); 
                          },
                        );
                      },
                    );
                  },
              child: Stack(
                    children: [
                      Card(
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Meta de días: ${listHabits[index].days}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.place, color: Colors.white),
            label: 'Añadir Hábito',
            backgroundColor: Colors.yellow,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, 
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Add(onAddHabit: _addHabit);
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.favorite_border, color: Colors.white),
            label: 'Eliminar Hábito',
            backgroundColor: Colors.red,
            onTap: () {
              print('Eliminar Hábito');
            },
          ),
        ],
      ),
    );
  }
}
