import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/person.dart';

class FirstPageMultiProviderScreen extends StatelessWidget {
  const FirstPageMultiProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String title = context.watch<String>();
    Person personStreamProvider = context.watch<Person>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main Multi Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text(personStreamProvider.name ?? ""),
          ],
        ),
      ),
    );
  }
}
