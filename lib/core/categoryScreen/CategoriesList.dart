import 'package:flutter/material.dart';
import 'package:movieapp/core/categoryScreen/GlobalCategory.dart';

class BollyWoodCat extends StatelessWidget {
  const BollyWoodCat({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalCategory(category: "bollywood",categoryName: "EXPLORE BOLLYWOOD",);
  }
}

class HollywoodCat extends StatelessWidget {
  const HollywoodCat({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalCategory(category: "hollywood",categoryName: "EXPLORE HOLLYWOOD",);
  }
}

class SouthCat extends StatelessWidget {
  const SouthCat({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalCategory(category: "south",categoryName: "EXPLORE SOUTH MOVIES",);
  }
}


class SeriesCat extends StatelessWidget {
  const SeriesCat({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalCategory(category: "series",categoryName: "EXPLORE SERIES",);
  }
}