import 'package:flutter/material.dart';

class BotaoFlutuante extends StatelessWidget {
  const BotaoFlutuante({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      hoverColor: Theme.of(context).colorScheme.inversePrimary,
      focusColor: Theme.of(context).colorScheme.inversePrimary,
      onPressed: onPressed,
      tooltip: 'Increment',
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
