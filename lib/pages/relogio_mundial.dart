import 'dart:async';
import 'package:flutter/material.dart';

class Relogio extends StatefulWidget {
  const Relogio({
    super.key,
  });

  @override
  State<Relogio> createState() => _RelogioState();
}

class _RelogioState extends State<Relogio> {
  DateTime _horaAtual = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Inicia o temporizador para atualizar a hora a cada segundo
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _horaAtual = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    // Cancela o temporizador ao sair da tela
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${_horaAtual.hour.toString().padLeft(2, '0')}:${_horaAtual.minute.toString().padLeft(2, '0')}:${_horaAtual.second.toString().padLeft(2, '0')}',
        style: const TextStyle(fontSize: 48),
      ),
    );
  }
}
