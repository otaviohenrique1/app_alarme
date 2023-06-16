import 'package:flutter/material.dart';

class NovoAlarme extends StatefulWidget {
  const NovoAlarme({super.key});

  @override
  State<NovoAlarme> createState() => _NovoAlarmeState();
}

class _NovoAlarmeState extends State<NovoAlarme> {
  bool repetir = false;
  bool pular = false;
  bool tomChamada = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Configurar alarme"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
            ],
          ),
          const Divider(),
          const TextField(
            decoration: InputDecoration(
              hintText: "Etiqueta",
              border: InputBorder.none,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Repetir"),
              Switch(
                value: repetir,
                onChanged: (value) {
                  setState(() {
                    repetir = value;
                  });
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pular"),
                  Text("Pular para o proximo alarme"),
                ],
              ),
              Switch(
                value: pular,
                onChanged: (value) {
                  setState(() {
                    pular = value;
                  });
                },
              ),
            ],
          ),
          const Divider(),
          InkWell(
            onTap: () {},
            child: Ink(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tom de Chamada"),
                  Text("AlarmBeep"),
                ],
              ),
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Pular"),
              Switch(
                value: tomChamada,
                onChanged: (value) {
                  setState(() {
                    tomChamada = value;
                  });
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
