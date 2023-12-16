import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/main_model.dart';
import 'package:state_management_provider/second_counter.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainModel model = Provider.of<MainModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Simple Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${model.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                child: const Text("Open counter 2"),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SecondCounter(title: "Second Counter"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
