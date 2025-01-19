import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:led_controller/core/error/exeptions.dart';
import 'package:led_controller/feature/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const ServerException('User is null');
      } else {
        await firebaseFirestore.collection('users').doc(response.user!.uid).set(
          {
            'name': name,
            'email': email,
            'createdAt': FieldValue.serverTimestamp(),
          },
        );
      }

      return UserModel.fromJson({
        'uid': response.user!.uid,
        'email': response.user!.email,
        'name': name,
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
