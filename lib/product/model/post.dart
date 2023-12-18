class Post{
final String token;
Post ({required this.token});

factory Post.fromJson(Map<String, dynamic> json) {
  return switch (json) {
    {
    'token': String token,
    } =>
        Post(
          token: token,
        ),
    _ => throw const FormatException('Failed to login.'),
  };
}





}

