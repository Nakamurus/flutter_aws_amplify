import 'package:aws_amplify/pages/login_page.dart';
import 'package:aws_amplify/pages/sign_up_page.dart';
import 'package:aws_amplify/services/auth_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authService.showLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photo Gallery App',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        home: StreamBuilder<AuthState>(
            stream: _authService.authStateController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Navigator(pages: [
                  if (snapshot.data.authFlowStatus == AuthFlowStatus.login)
                    MaterialPage(
                        child: LoginPage(
                            shouldShowSignUp: _authService.showSignUp)),
                  if (snapshot.data.authFlowStatus == AuthFlowStatus.signUp)
                    MaterialPage(
                        child:
                            SignUpPage(shouldShowLogin: _authService.showLogin))
                ], onPopPage: (route, result) => route.didPop(result));
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
