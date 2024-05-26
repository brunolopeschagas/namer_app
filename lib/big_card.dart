import 'package:flutter/material.dart';
import 'package:namer_app/model/names.dart';

class BigCard extends StatelessWidget {
  final Name name;

  const BigCard({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    name.generateName;

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          name.completeName,
          style: style,
          semanticsLabel: "${name.firstName} ${name.lastName}",
        ),
      ),
    );
  }
}
