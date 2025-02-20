class AuthEntity
{
  AuthEntity({required this.email, required this.password});

  final String email;
  final String password;

  factory AuthEntity.fromJson(Map<String, dynamic> json)
  {
    return AuthEntity(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson()
  {
    return
    {
      'email': email,
      'password': password,
    };
  }
}
