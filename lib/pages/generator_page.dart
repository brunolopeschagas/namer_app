import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:namer_app/big_card.dart';
import 'package:namer_app/service/names.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatelessWidget {
  final Names names;
  const GeneratorPage({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var name = appState.currentName;

    IconData icon;
    if (appState.favoritesNames.contains(name)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    names.save(name);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(name: name),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: const Text('Favoritar'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Gerar nome'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
