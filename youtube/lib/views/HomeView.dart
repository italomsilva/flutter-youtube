import 'package:flutter/material.dart';
import 'package:youtube/Services/Api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.pesquisar("");
    return Text("Inicio");
  }
}
