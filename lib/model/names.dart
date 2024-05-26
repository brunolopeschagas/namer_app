// ignore_for_file: public_member_api_docs, sort_constructors_first
class Name {
  String firstName;
  String lastName;
  String completeName = '';

  Name({
    required this.firstName,
    required this.lastName,
  }) {
    completeName = generateName();
  }

  String generateName() {
    completeName = firstName + lastName;
    return completeName;
  }
}
