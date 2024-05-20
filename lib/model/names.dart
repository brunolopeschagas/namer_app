// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Name {
  String fisrtName;
  String lastName;
  String completeName = '';

  final String _join = ' the ';
  final List<String> _sufix = ['rer', 'ist'];

  Name({
    required this.fisrtName,
    required this.lastName,
  }) {
    completeName = generateName();
  }

  String generateName() {
    String completeName = fisrtName;
    int randonjoinIndex = Random().nextInt(2);
    int randonSufixIndex = Random().nextInt(2);
    if (randonjoinIndex == 1) {
      completeName += _join;
      lastName += _sufix[randonSufixIndex];
    }

    completeName += lastName;
    return completeName;
  }
}
