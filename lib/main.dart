import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/main_model.dart';
import 'package:state_management_provider/provider_screen.dart';
import 'package:state_management_provider/second_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState");
    return Consumer<MainModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const ProviderScreen(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (value) => _selectPage(value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "provider"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: "Future Provider"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.counter++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
