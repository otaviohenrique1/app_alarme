import 'dart:async';

import 'package:flutter/material.dart';

class Cronometro extends StatefulWidget {
  const Cronometro({
    super.key,
  });

  @override
  State<Cronometro> createState() => _CronometroState();
}

class _CronometroState extends State<Cronometro> {
  int _minutos = 0;
  int _segundos = 0;
  int _milissegundos = 0;
  Timer? _timer;

  void _startTimer() {
    // Cria um temporizador que executa a função a cada 1 segundo
    _timer = Timer.periodic(const Duration(microseconds: 1), (timer) {
      setState(() {
        _milissegundos += 1;
        if (_milissegundos >= 1000) {
          _milissegundos = 0;
          _segundos++;
          if (_segundos >= 60) {
            _segundos = 0;
            _minutos++;
          }
        }
      });
    });
  }

  void _cancelTimer() {
    // Cancela o temporizador se estiver ativo
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  void _resetTimer() {
    setState(() {
      _minutos = 0;
      _segundos = 0;
      _milissegundos = 0;
      _cancelTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      children: [
        CronometroPequeno(
          minutos: _minutos,
          segundos: _segundos,
          milissegundos: _milissegundos,
        ),
        CronometroGrande(
          minutos: _minutos,
          segundos: _segundos,
          milissegundos: _milissegundos,
        ),
        ElevatedButton(
          onPressed: _startTimer,
          child: const Text("Iniciar"),
        ),
        ElevatedButton(
          onPressed: _cancelTimer,
          child: const Text("Parar"),
        ),
        ElevatedButton(
          onPressed: _resetTimer,
          child: const Text("Zerar"),
        ),
      ],
    );
  }
}

class CronometroGrande extends StatelessWidget {
  const CronometroGrande({
    super.key,
    required int minutos,
    required int segundos,
    required int milissegundos,
  })  : _minutos = minutos,
        _segundos = segundos,
        _milissegundos = milissegundos;

  final int _minutos;
  final int _segundos;
  final int _milissegundos;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_minutos.toString().padLeft(2, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 48)),
        const Text(":",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 48)),
        Text(_segundos.toString().padLeft(2, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 48)),
        const Text(":",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 48)),
        Text(_milissegundos.toString().padLeft(3, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 48)),
      ],
    );
  }
}

class CronometroPequeno extends StatelessWidget {
  const CronometroPequeno({
    super.key,
    required int minutos,
    required int segundos,
    required int milissegundos,
  })  : _minutos = minutos,
        _segundos = segundos,
        _milissegundos = milissegundos;

  final int _minutos;
  final int _segundos;
  final int _milissegundos;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(_minutos.toString().padLeft(2, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
        const Text(":",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        Text(_segundos.toString().padLeft(2, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
        const Text(":",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        Text(_milissegundos.toString().padLeft(3, '0'),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
