import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback shouldShowSignUp;
  LoginPage({Key key, this.shouldShowSignUp}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(children: [
          _loginForm(),
          Container(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: widget.shouldShowSignUp,
              child: Text('Dont\'t have an account? Sign up.'),
            ),
          )
        ]),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration:
              InputDecoration(icon: Icon(Icons.mail), labelText: 'Username'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_open), labelText: 'Password'),
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        FlatButton(
          onPressed: _login,
          child: Text('Login'),
          color: Theme.of(context).accentColor,
        )
      ],
    );
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('username: $username');
    print('password : $password');
  }
}
