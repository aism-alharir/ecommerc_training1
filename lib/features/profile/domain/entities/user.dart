class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? imageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.imageUrl,
  });
}