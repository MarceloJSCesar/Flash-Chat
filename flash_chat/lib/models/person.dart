class Person {
  String? email;
  String? password;

  Person({
    required this.email,
    required this.password,
  });

  factory Person.fromJson(Map<String, dynamic> data) {
    return Person(
      email: data['email'],
      password: data['password'],
    );
  }

  @override
  String toString() {
    return 'Person: email: $email, password: $password';
  }
}
