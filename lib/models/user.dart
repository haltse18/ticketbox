class User {
  String userId;
  String name;
  bool isAdmin;
  String status;

  User({
    required this.userId,
    required this.name,
    required this.isAdmin,
    required this.status
  });

  @override
  String toString() {
    return 'id: $userId; name: $name; isAdmin: $isAdmin; status: $status';
  }
}