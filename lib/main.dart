import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb; //para la parte web

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _buttonStatus = 'Presiona un botón';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Prueba Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _buttonStatus,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _buttonStatus = 'Botón 1 presionado';
                });
              },
              child: const Text('Botón Test 1'),
            ),
            const SizedBox(height: 10),
            // Modifica los botones para mostrar comportamiento diferente en web si es necesario
             ElevatedButton(
               onPressed: () {
                setState(() {
               _buttonStatus = 'Botón 1 presionado';
                            });
               if (kIsWeb) {
               // Comportamiento específico para web
                 print('Acción en web');
                  }
                   },
                    child: const Text('Botón Test 1'),
                           ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _buttonStatus = 'Botón 2 presionado';
                });
              },
              child: const Text('Botón Test 2'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Mensaje de prueba!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text('Mostrar Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}