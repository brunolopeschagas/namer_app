// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:namer_app/model/names.dart';
import 'package:namer_app/service/names.dart';

class AllNamesPage extends StatelessWidget {
  final Names names;

  const AllNamesPage({super.key, required this.names});

  Future<List<Name>> _getAllNames() async {
    return names.getAll();
  }

  @override
  Widget build(BuildContext context) {
    final Future<List<Name>> namesFuture = _getAllNames();
    return FutureBuilder<List<Name>>(
      future: namesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar os dados.'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum dado disponível.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final name = snapshot.data![index];
            return ListTile(
              trailing: const Icon(Icons.accessibility_sharp),
              title: Text(name.completeName),
              subtitle: Text('${name.firstName} ${name.lastName}'),
            );
          },
        );
      },
    );
  }
}
