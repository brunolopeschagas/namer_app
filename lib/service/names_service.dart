import 'package:namer_app/model/names.dart';
import 'package:namer_app/service/names.dart';

class NamesServiceInMemory implements Names {
  List<Name> names = [
    Name(firstName: 'chair', lastName: 'blasfemous'),
    Name(firstName: 'stonk', lastName: 'wise'),
    Name(firstName: 'stone', lastName: 'gold'),
    Name(firstName: 'parrot', lastName: 'blue'),
    Name(firstName: 'carrot', lastName: 'yellows'),
  ];

  @override
  List<Name> getAll() {
    return names;
  }

  @override
  void save(Name name) {
    names.add(name);
  }
}
