import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProxyProvider extends StatefulWidget {
  const MainProxyProvider({super.key});

  @override
  State<MainProxyProvider> createState() => _MainProxyProviderState();
}

class _MainProxyProviderState extends State<MainProxyProvider> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proxy Provider"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times:"),
            ProxyProvider0<int>( //a provider that builds a value based on external values that change overtime
              update: (context, _) => _counter,
              child: const CounterNumber(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterNumber extends StatelessWidget {
  const CounterNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<int>(context).toString();
    return Text(counter);
  }
}