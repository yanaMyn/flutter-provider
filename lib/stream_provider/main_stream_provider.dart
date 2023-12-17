import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/person.dart';
import 'package:state_management_provider/stream_provider/content_stream_provider.dart';

class MainStreamProviderScreen extends StatelessWidget {
  const MainStreamProviderScreen({super.key});

  Stream<Person> stream() async* {
    await Future.delayed(const Duration(seconds: 2),);
    yield Person(name: "Budi Doremi");
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person>(
      initialData: Person(name: "Budi"),
      create: (context) {
        return stream();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Main Stream Provider"),
        ),
        body: const Center(
          child: ContentStreamProvider(),
        ),
      ),
    );
  }
}
