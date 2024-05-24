import 'package:flutter/material.dart';
import 'package:namer_app/model/names.dart';
import 'package:namer_app/service/names_service.dart';

class AllNamesPage extends StatefulWidget {
  const AllNamesPage({super.key});

  @override
  State<AllNamesPage> createState() => _AllNamesPageState();
}

class _AllNamesPageState extends State<AllNamesPage> {
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: eCtrl,
          onSubmitted: (text) {
            litems.add(text);
            eCtrl.clear();
            setState(() {});
          },
        ),
        buildFutureBuilder(),
      ],
    );
  }

  Future<List<Name>> _loadData() async {
    return NamesServiceInMemory().getAll();
  }

  buildFutureBuilder() {
    return FutureBuilder<List<Name>>(
        future: _loadData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: Text("Carregando..."));
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Erro ao carregar..."),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Name name = snapshot.data![index];
                    return ListTile(
                      leading: const Icon(Icons.favorite),
                      title: Text(name.completeName),
                    );
                  },
                );
              }
          }
        });
  }
}
