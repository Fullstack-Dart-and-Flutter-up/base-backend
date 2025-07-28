// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int id;
  final String name;
  final String lastName;
  final DateTime birthday;
  final String status;
  final String document;
  final String email;
  final String city;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.birthday,
    required this.status,
    required this.document,
    required this.email,
    required this.city,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastName: $lastName, birthday: $birthday, status: $status, document: $document, email: $email, city: $city)';
  }
}
