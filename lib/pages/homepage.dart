import 'package:app_alarme/pages/alarmes.dart';
import 'package:app_alarme/pages/cronometro.dart';
import 'package:app_alarme/pages/relogio_mundial.dart';
import 'package:app_alarme/pages/temporizador.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text("Alarme", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.white,
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Alarmes"),
              Tab(text: "Relogio Mundial"),
              Tab(text: "Cronometro"),
              Tab(text: "Temporizador"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Alarmes(),
            RelogioMundial(),
            Cronometro(),
            Temporizador(),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   shape: const CircleBorder(),
        //   backgroundColor: Theme.of(context).colorScheme.primary,
        //   hoverColor: Theme.of(context).colorScheme.inversePrimary,
        //   focusColor: Theme.of(context).colorScheme.inversePrimary,
        //   onPressed: () {},
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
