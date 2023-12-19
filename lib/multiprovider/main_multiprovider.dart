import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/multiprovider/first_page_multiprovider.dart';
import 'package:state_management_provider/provider/person.dart';

class MainMultiProvider extends StatelessWidget {
  const MainMultiProvider({super.key});

  Stream<Person> stream() async* {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    yield Person(name: "diding from stream builder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main Multi Provider"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Next page"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) {
                return MultiProvider(
                  providers: [
                    Provider(create: (_) => "Title form parent"),
                    StreamProvider<Person>(
                      create: (_) => stream(),
                      initialData: Person(name: "loading"),
                    )
                  ],
                  child: const FirstPageMultiProviderScreen(),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
