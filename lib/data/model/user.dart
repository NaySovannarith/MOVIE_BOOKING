class User {
  int id;
  String fullName;
  String email;
  String? phoneNumber;
  String? dateOfBirth;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.dateOfBirth,
  });
}
