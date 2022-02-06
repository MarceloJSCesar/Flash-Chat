class User {
  String? email;
  String? password;

  User({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'User: email: $email, password: $password';
  }
}
