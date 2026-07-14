import 'dart:convert';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool emailVarification;
  final String phone;
  final bool phoneVarification;
  final String avatarUrl;
  final String city;
  final String role;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVarification,
    required this.phone,
    required this.phoneVarification,
    required this.avatarUrl,
    required this.city,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      email: jsonData['email'],
      emailVarification: jsonData['email_varification'],
      phone: jsonData['phone'],
      phoneVarification: jsonData['phone_varification'],
      avatarUrl: jsonData['avatar_url'],
      city: jsonData['city'],
      role: jsonData['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'city': city,
      'role': role,
      'email_verification': emailVarification,
      'phone_verification': phoneVarification,
      'avatar_url': avatarUrl,
    };
  }
}
