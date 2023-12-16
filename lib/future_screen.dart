import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class FutureScreen extends StatelessWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Future Provider"),
      ),
      body: FutureProvider<String>(
        create: (context) => Future.delayed(const Duration(seconds: 4), () => "halloow"),
        initialData: "Loading",
        child: Center(
          child: Consumer<String>(
            builder: (context, value, child) {
              return Text(value,);
            }
          ),
        ),
      ),
    );
  }
}
