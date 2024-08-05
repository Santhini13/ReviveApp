class Users {
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String role;


  Users({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.role, required String uid,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'phoneNumber': phoneNumber,
      'email': email,
      'role': role,
      
    };
  }
}
