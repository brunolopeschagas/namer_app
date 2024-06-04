import 'package:flutter/material.dart';
import 'package:namer_app/app_state.dart';
import 'package:namer_app/pages/all_page.dart';
import 'package:namer_app/pages/favorites_page.dart';
import 'package:namer_app/pages/generator_page.dart';
import 'package:namer_app/service/names_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyAppState()),
      ],
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var favoritesIcon = Icons.favorite_border;
    var appState = context.watch<MyAppState>();
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(names: NamesServiceInMemory());
      case 1:
        page = const FavoritesPage();
      case 2:
        page = AllNamesPage(names: NamesServiceInMemory());
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    if (appState.favoritesNames.isEmpty == false) {
      favoritesIcon = Icons.favorite;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  const NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(favoritesIcon),
                    label: const Text('Favoritos'),
                  ),
                  const NavigationRailDestination(
                    icon: Icon(Icons.all_inbox_rounded),
                    label: Text('Todos'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
