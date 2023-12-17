import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/person.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({super.key});

  @override
  State<FirstPageScreen> createState() => _FirstPageScreenState();
}

class _FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("First Page"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<Person>().name = "Hello ${Random().nextInt(100).toString()}";
              setState(() {                
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text(context.watch<Person>().name ?? ""),
      ),
    );
  }
}
