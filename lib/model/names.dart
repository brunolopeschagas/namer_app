// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Name {
  String firstName;
  String lastName;
  String completeName = '';

  final String _join = ' the ';
  final List<String> _sufixConsoant = ['er', 'ist', 'or'];
  final List<String> _sufixVogal = ['rer', 'ist', 'ror'];

  Name({
    required this.firstName,
    required this.lastName,
  }) {
    completeName = generateName();
  }

  String generateName() {
    String completeName = firstName;
    int randonjoinIndex = Random().nextInt(2);
    int randonSufixIndex = Random().nextInt(3);
    if (randonjoinIndex == 1) {
      completeName += _join;
      if (isFinishInVogal(lastName)) {
        lastName += _sufixConsoant[randonSufixIndex];
      } else {
        lastName += _sufixVogal[randonSufixIndex];
      }
    }

    completeName += lastName;
    return completeName;
  }

  bool isFinishInVogal(String text) {
    if (text.substring(text.length - 1).contains(RegExp('\b[aeiyou]+\b'))) {
      return true;
    }
    return false;
  }
}
