import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wimax/models/user_model.dart';
import 'package:wimax/utils/logger.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  bool _isLoading = false;
  String? _error;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _fetchUserData(user.uid);
      } else {
        _user = null;
        notifyListeners();
      }
    });
  }

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _fetchUserData(userCredential.user!.uid);
      }
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Authentication failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password, String name) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final user = UserModel(
          id: userCredential.user!.uid,
          email: email,
          name: name,
          role: 'user',
          createdAt: DateTime.now(),
          lastLogin: DateTime.now(),
        );

        await _firestore.collection('users').doc(user.id).set(user.toMap());
        _user = user;
      }
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Registration failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _auth.signOut();
      _user = null;
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Logout failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? currentPassword,
    String? newPassword,
  }) async {
    if (_user == null) throw 'Not authenticated';

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not found';

      if (email != null && email != user.email) {
        await user.updateEmail(email);
      }

      if (newPassword != null && currentPassword != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);
      }

      final updates = <String, dynamic>{};
      if (name != null) updates['name'] = name;
      if (email != null) updates['email'] = email;
      updates['lastLogin'] = DateTime.now();

      await _firestore.collection('users').doc(user.uid).update(updates);
      await _fetchUserData(user.uid);
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Profile update failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Password reset failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteAccount() async {
    if (_user == null) throw 'Not authenticated';

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final user = _auth.currentUser;
      if (user == null) throw 'User not found';

      await _firestore.collection('users').doc(user.uid).delete();
      await user.delete();
      _user = null;
    } on FirebaseAuthException catch (e) {
      _error = e.message ?? 'Account deletion failed';
      rethrow;
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _fetchUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        _user = UserModel.fromMap(doc.data()!);
        notifyListeners();
      }
    } catch (e, stackTrace) {
      logError('Failed to fetch user data', e, stackTrace);
      rethrow;
    }
  }

  Future<void> checkAuthState() async {
    try {
      _auth.authStateChanges().listen((User? user) async {
        if (user != null) {
          await _fetchUserData(user.uid);
        } else {
          _user = null;
          notifyListeners();
        }
      });
    } catch (e, stackTrace) {
      logError('Failed to check auth state', e, stackTrace);
      rethrow;
    }
  }
}
