import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/first_page.dart';
import 'package:state_management_provider/provider/person.dart';

class MainProviderScreen extends StatelessWidget {
  const MainProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main Provider"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Provider( //actually wrap this Provider class in MaterialApp
                      create: (_) => Person(age: 15, name: "dudi"),
                      child: const FirstPageScreen(),);
                  },
                ),
              );
            },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      body: Center(),
    );
  }
}
