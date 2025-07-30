// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String lastName;
  final String userscol;
  final DateTime birthday;
  final String status;
  final String document;
  final String email;
  final String city;

  User(
    this.name,
    this.lastName,
    this.userscol,
    this.birthday,
    this.status,
    this.document,
    this.email,
    this.city,
  );

  @override
  String toString() {
    return 'User( name: $name, lastName: $lastName, userscol: $userscol, birthday: $birthday, status: $status, document: $document, email: $email, city: $city)';
  }
}
