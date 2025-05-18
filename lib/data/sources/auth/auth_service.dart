/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/auth/create_user_req.dart';
import 'package:cinema_booking/data/models/auth/edit_user_req.dart';
import 'package:cinema_booking/data/models/auth/signin_user_req.dart';
import 'package:cinema_booking/data/models/auth/user.dart';
import 'package:cinema_booking/domain/entities/auth/user.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Future<Either<String, String>> signup(CreateUserReq createUserReq);
  Future<Either<String, String>> signin(SigninUserReq signinUserReq);
  Future<Either<String, String>> signOut();
  Future<Either<String, UserEntity>> getUser();
  Future<Either<String, String>> editUserInfo(EditUserReq edit);
  Future<Either<String, String>> signInWithGoogle();
  Future<bool> isSignedIn();
}

class AuthServiceImpl extends AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthServiceImpl({FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<Either<String, String>> signin(SigninUserReq signinUserReq) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Signin was Successful');
    } catch (e) {
      return Left('Error signing in');
    }
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      print('Starting Firebase signup process');
      print('Email: ${createUserReq.email}');
      print('Full Name: ${createUserReq.fullName}');
      
      // Create user with email and password
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: createUserReq.email!,
        password: createUserReq.password,
      );

      String uid = userCredential.user!.uid;
      print('User created with UID: $uid');

      // Save user data to Firestore
      try {
        await firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': createUserReq.email,
          'fullName': createUserReq.fullName,
          'age': createUserReq.age,
          'gender': createUserReq.gender,
          'createdAt': FieldValue.serverTimestamp(),
        });
        print('User data saved to Firestore successfully');
      } catch (e) {
        print('Error saving user data to Firestore: $e');
        // Don't throw here, as we've already created the Firebase Auth user
      }

      return const Right('Signup was Successful');
    } catch (e) {
      print('Error during signup: $e');
      return Left('Error signing up: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> editUserInfo(EditUserReq edit) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null && edit.email == user.email && edit.password != null) {
        await user.updatePassword(edit.password!);
      }

      String uid = user!.uid;

      // Save user data to Firestore
      await firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': edit.email,
        'fullName': edit.fullName,
        'age': edit.age,
        'gender': edit.gender,
        'createdAt': FieldValue.serverTimestamp(), // Store account creation timestamp
      });

      return const Right('Update was Successful');
    } catch (e) {
      return Left('Update Fails');
    }
  }

  @override
  Future<Either<String, String>> signOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
      return const Right('Signout was successful');
    } catch (e) {
      return Left('Error signing out');
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc = await firestore.collection('users').doc(currentUser.uid).get();

        if (userDoc.exists && userDoc.data() != null) {
          UserModel userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

          return Right(userModel.toEntity()); // Return user model
        } else {
          return Left('User data not found in Firestore');
        }
      } else {
        return Left('No user is currently signed in');
      }
    } catch (e) {
      return Left('Error retrieving user data: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> signInWithGoogle() async {
    try {
      // Create a new instance of GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        clientId: '1060398365647-meo9d69koc874jcq51dcvj5nop5gt218.apps.googleusercontent.com',
        scopes: ['email'],
      );

      // First try to sign in silently (this might work if user has signed in before)
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await googleSignIn.signInSilently();
      } catch (_) {
        // Ignore error from silent sign in
      }

      // If silent sign in didn't work, try interactive sign in
      googleUser ??= await googleSignIn.signIn();

      if (googleUser == null) {
        return Left('Google sign-in was cancelled by user');
      }

      // Get the auth details
      final googleAuth = await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        return Left('Failed to sign in with Firebase');
      }

      // Update or create user document in Firestore
      try {
        final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'uid': user.uid,
            'email': user.email ?? '',
            'fullName': user.displayName ?? '',
            'createdAt': FieldValue.serverTimestamp(),
            'age': 18,
            'gender': 'Not specified',
          });
        }
      } catch (e) {
        // Log Firestore error but don't fail the sign-in
        print('Warning: Failed to update Firestore: $e');
      }

      return Right('Successfully signed in with Google');
    } catch (e) {
      return Left('Error signing in with Google: ${e.toString()}');
    }
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}
