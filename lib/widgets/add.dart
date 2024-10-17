import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  final Function(String) onAddHabit; 

  const Add({super.key, required this.onAddHabit});

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final habitName = _controller.text.trim();
    if (habitName.isNotEmpty) {
      widget.onAddHabit(habitName);
      Navigator.pop(context); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Añadir Hábito',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Nombre del Hábito',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text('Añadir'),
          ),
        ],
      ),
    );
  }
}
