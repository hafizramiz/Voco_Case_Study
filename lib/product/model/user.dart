


class User {
  final String id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  const User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'email': String email,
      'first_name': String first_name,
      'last_name': String last_name,
      'avatar':String avatar
      } =>
          User(
            id: id,
            email: email,
            first_name: first_name,
            last_name: last_name,
            avatar: avatar
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}