class Users {
  const Users(
      {required this.name, required this.email, required this.profilePath});

  Users.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          email: json['email']! as String,
          profilePath: json['profile_path']! as String,
        );

  final String name;
  final String email;
  final String profilePath;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_path': profilePath,
    };
  }
}
