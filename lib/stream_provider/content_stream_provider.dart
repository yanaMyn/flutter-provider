import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/provider/person.dart';

class ContentStreamProvider extends StatelessWidget {
  const ContentStreamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.watch<Person>().name ?? "");
  }
}