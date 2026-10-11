import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const RollTheDiceApp());
}

class RollTheDiceApp extends StatelessWidget {
  const RollTheDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll the Dice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      home: const DiceRoller(),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final Random _random = Random();
  int _currentValue = 1;

  void _rollDice() {
    setState(() {
      // nextInt(6) vracia 0–5, preto +1 => rozsah 1–6.
      _currentValue = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roll the Dice')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$_currentValue.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 24),
            Text(
              'Hodená hodnota: $_currentValue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _rollDice,
              icon: const Icon(Icons.casino),
              label: const Text('Hoď kockou'),
            ),
          ],
        ),
      ),
    );
  }
}
