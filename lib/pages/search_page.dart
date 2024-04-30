import 'package:flutter/material.dart';
import 'package:weather_app/component/search_component.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Location",
        ),
      ),
      body: const SearchComponent(),
    );
  }
}
