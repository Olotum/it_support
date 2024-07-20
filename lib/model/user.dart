enum User {
  tecnico(
    name: 'joão',
  ),
  user1(
    name: 'jose'
  );

  const User({
    required this.name,
  });

  final String name;
}
