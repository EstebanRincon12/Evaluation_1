import 'package:evaluacion/widgets/add_habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.ad_units, color: Colors.white),
            label: 'Agregar Habito',
            backgroundColor: Colors.green,
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled:
                    true, // Permite que el modal ocupe más espacio
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return const AddHabit();
                },
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.favorite_border, color: Colors.white),
            label: 'Resumen',
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
