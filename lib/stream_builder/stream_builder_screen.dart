import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatelessWidget {
  const StreamBuilderScreen({super.key});

  Stream counter() async* {
    await Future.delayed(const Duration(seconds: 2));
    yield 1;

    await Future.delayed(const Duration(seconds: 2));
    yield 2;

    await Future.delayed(const Duration(seconds: 2));
    yield "any";
  }

  @override
  Widget build(BuildContext context) {
    print("StreamBuilderScreen");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Stream Builder"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: counter(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text(
                  "Loading",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              }
          
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              }
          
              if (snapshot.hasError) {
                return const Text(
                  "Error..",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
