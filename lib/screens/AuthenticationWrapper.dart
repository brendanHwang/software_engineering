import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering/screens/SearchScreen.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginScreen();  // 사용자가 로그인하지 않은 경우 로그인 화면 표시
          }
          return const SearchScreen(); // 사용자가 로그인하는 경우 홈 화면 표시
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),  // 연결 상태가 활성화될 때까지 로딩 표시
          ),
        );
      },
    );
  }
}
