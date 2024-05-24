import 'package:namer_app/model/names.dart';
import 'package:namer_app/service/names.dart';

class NamesServiceInMemory implements Names {
  List<Name> names = [
    Name(fisrtName: 'chair', lastName: 'blasfemous'),
    Name(fisrtName: 'stonk', lastName: 'wise'),
    Name(fisrtName: 'stone', lastName: 'gold'),
    Name(fisrtName: 'parrot', lastName: 'blue'),
    Name(fisrtName: 'carrot', lastName: 'yellows'),
  ];

  @override
  List<Name> getAll() {
    return this.names;
  }

  @override
  void save(Name name) {
    this.names.add(name);
  }
}
