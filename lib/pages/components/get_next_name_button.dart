import 'package:flutter/material.dart';
import 'package:namer_app/shared/app_state.dart';
import 'package:provider/provider.dart';

class GetNextNameButton extends StatelessWidget {
  const GetNextNameButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return ElevatedButton.icon(
      onPressed: () {
        appState.getNext();
      },
      icon: const Icon(Icons.arrow_forward_outlined),
      label: const Text('Gerar nome'),
    );
  }
}
