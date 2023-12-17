import 'package:flutter/material.dart';
import 'package:state_management_provider/future/future_screen.dart';
import 'package:state_management_provider/provider/main_provider.dart';
import 'package:state_management_provider/stream_builder/stream_builder_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
    Widget content = const MainProviderScreen();
    
    if (_selectedPageIndex == 1) {
      content = const StreamBuilderScreen();
    }

    if (_selectedPageIndex == 2) {
      content = const FutureScreen();
    }

    return Scaffold(
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (value) => _selectPage(value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "provider"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Stream Builder"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Future Provider"),
        ],
      ),
    );
  }
}
