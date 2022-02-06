class User {
  String? email;
  String? password;

  User({
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      email: data['email'],
      password: data['password'],
    );
  }

  @override
  String toString() {
    return 'User: email: $email, password: $password';
  }
}
