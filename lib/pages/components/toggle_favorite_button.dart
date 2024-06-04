import 'package:flutter/material.dart';
import 'package:namer_app/shared/app_state.dart';
import 'package:provider/provider.dart';

class ToggleFavoriteButton extends StatelessWidget {
  const ToggleFavoriteButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ElevatedButton.icon(
      onPressed: () {
        appState.toggleFavorite();
      },
      icon: Icon(icon),
      label: const Text('Favoritar'),
    );
  }
}
