import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/future/future_content.dart';
import 'dart:async';

import 'package:state_management_provider/provider/person.dart';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  Future<Person> _getPerson() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    return Person(name: "Andi");
  }

  @override
  Widget build(BuildContext context) {
    print("FutureScreen");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Future Provider"),
      ),
      body: FutureProvider<Person>(
        create: (_) => _getPerson(),
        initialData: Person(name: "Agung"),
        child: const Center(
          child: FutureContent(),
        ),
      ),
    );
  }
}
