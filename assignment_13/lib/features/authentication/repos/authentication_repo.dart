import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp({
    required String contact,
    required String password,
  }) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: contact,
      password: password,
    );
  }

  Future<void> signIn(
      {required String contact, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: contact, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());

final authState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChanges();
});
