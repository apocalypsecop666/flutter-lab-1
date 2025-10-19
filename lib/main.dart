import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const InteractiveCounterPage(),
    );
  }
}

class InteractiveCounterPage extends StatefulWidget {
  const InteractiveCounterPage({super.key});

  @override
  State<InteractiveCounterPage> createState() => _InteractiveCounterPageState();
}

class _InteractiveCounterPageState extends State<InteractiveCounterPage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  void _processInput() {
    final input = _controller.text.trim();

    setState(() {
      if (input.toLowerCase() == 'reset') {
        _counter = 0;
        _message = 'Counter has been reset!';
      } else if (int.tryParse(input) != null) {
        _counter += int.parse((input));
        _message = 'Added $input to the counter!';
      } else if (input.isEmpty) {
        _message = 'Try to enter anything.';
      } else {
        _message = 'Not a valid number!';
      }
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 1 - Interactive Counter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current count:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter number or command',
                  hintText: 'Try 59824 or reset',
                ),
                onSubmitted: (_) => _processInput(),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _processInput,
                icon: const Icon(Icons.arrow_downward_sharp),
                label: const Text('Enter'),
              ),
              const SizedBox(height: 20),
              Text(
                _message,
                style: TextStyle(
                  color: _message.contains('Not a')
                      ? Colors.red
                      : _message.contains('reset')
                      ? Colors.purple
                      : Colors.green,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
