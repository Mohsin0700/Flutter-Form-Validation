import 'package:flutter/material.dart';
import 'package:forms/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  String? _emailErr;
  final passwordFocus = FocusNode();

  void _checkEmail(String email) {
    if (!email.contains('@')) {
      setState(() {
        _emailErr = 'Enter valie Email i.e @gmai.com';
      });
    } else if (!email.contains('.com')) {
      setState(() {
        _emailErr = 'Enter valid email i.e .com';
      });
    } else if (email.contains(' ')) {
      setState(() {
        _emailErr = 'Remove Spaces';
      });
    } else {
      setState(() {
        _emailErr = null;
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form Validation")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text("Enter Email"),
                      errorText: _emailErr,
                    ),
                    onSubmitted: (value) {
                      print(value);
                      _checkEmail(value);
                    },
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(label: Text("Enter Password")),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("Login button pressed");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(),
                      ),
                    ),
                    child: Text("Login"),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    label: Text('Go to Signup'),
                    icon: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
