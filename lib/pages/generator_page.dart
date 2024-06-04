import 'package:flutter/material.dart';
import 'package:namer_app/shared/app_state.dart';
import 'package:namer_app/shared/components/big_card.dart';
import 'package:namer_app/pages/components/get_next_name_button.dart';
import 'package:namer_app/pages/components/toggle_favorite_button.dart';
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
              ToggleFavoriteButton(icon: icon),
              const SizedBox(width: 10),
              const GetNextNameButton(),
            ],
          ),
        ],
      ),
    );
  }
}
