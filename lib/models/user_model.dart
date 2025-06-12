import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String role;
  final DateTime createdAt;
  final DateTime lastLogin;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    required this.role,
    required this.createdAt,
    required this.lastLogin,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? role,
    DateTime? createdAt,
    DateTime? lastLogin,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'lastLogin': lastLogin.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String?,
      role: map['role'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      lastLogin: DateTime.parse(map['lastLogin'] as String),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.role == role &&
        other.createdAt == createdAt &&
        other.lastLogin == lastLogin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        role.hashCode ^
        createdAt.hashCode ^
        lastLogin.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, phone: $phone, role: $role, createdAt: $createdAt, lastLogin: $lastLogin)';
  }

  bool get isSignedIn => id.isNotEmpty;

  factory UserModel.fromFirebaseUser(firebase_auth.User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      phone: user.phoneNumber,
      role: 'user', // Default role
      createdAt: DateTime.now(), // TODO: Get from Firestore
      lastLogin: DateTime.now(),
    );
  }
}
