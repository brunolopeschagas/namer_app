import 'package:flutter/material.dart';
import 'package:namer_app/shared/app_state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favoritesNames.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favoritesNames.length} favorites:'),
        ),
        for (var name in appState.favoritesNames)
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text(name.completeName),
            trailing: IconButton(
                onPressed: () => {
                      appState.deleteFavorite(name),
                    },
                icon: const Icon(Icons.delete)),
          ),
      ],
    );
  }
}
