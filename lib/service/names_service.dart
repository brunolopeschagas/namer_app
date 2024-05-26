import 'package:namer_app/model/names.dart';
import 'package:namer_app/service/names.dart';

class NamesServiceInMemory implements Names {
  List<Name> names = [];

  @override
  List<Name> getAll() {
    return names;
  }

  @override
  void save(Name name) {
    names.add(name);
  }
}
