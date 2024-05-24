import 'package:namer_app/model/names.dart';

abstract interface class Names {
  void save(Name name);
  List<Name> getAll();
}
