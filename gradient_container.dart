import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  final List<int> diceValues = [2, 2, 2];

  void rollDice(int index) {
    setState(() {
      if (index == 0) {
        diceValues[0] = randomizer.nextInt(6) + 1;
      } else if (index == 1) {
        diceValues[0] = randomizer.nextInt(6) + 1;
        diceValues[1] = randomizer.nextInt(6) + 1;
      } else {
        diceValues[0] = randomizer.nextInt(6) + 1;
        diceValues[1] = randomizer.nextInt(6) + 1;
        diceValues[2] = randomizer.nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dice Roller'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.filter_1)), // Tab 1 dadu
              Tab(icon: Icon(Icons.filter_2)), // Tab 2 dadu
              Tab(icon: Icon(Icons.filter_3)), // Tab 3 dadu
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(3, (index) => DiceTab(
                diceValues: diceValues.sublist(0, index + 1),
                onRoll: () => rollDice(index),
              )),
        ),
      ),
    );
  }
}

class DiceTab extends StatelessWidget {
  final List<int> diceValues;
  final VoidCallback onRoll;

  const DiceTab({super.key, required this.diceValues, required this.onRoll});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: diceValues
              .map((value) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/dice-$value.png',
                      width: 100,
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onRoll,
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
