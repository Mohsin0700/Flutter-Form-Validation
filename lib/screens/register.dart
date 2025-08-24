import 'package:flutter/material.dart';
import 'package:forms/widgets/my_textform_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextformField(
                            controller: firstNameController,
                            hint: 'First Name',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: MyTextformField(
                            controller: lastNameController,
                            hint: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    MyTextformField(controller: emailController, hint: 'Email'),
                    SizedBox(height: 10),
                    MyTextformField(
                      controller: passwordController,
                      hint: 'Password',
                    ),
                    SizedBox(height: 10),

                    MyTextformField(
                      controller: confirmPasswordController,
                      hint: 'Confirm Password',
                    ),

                    ElevatedButton(
                      onPressed: () {
                        print("Login button pressed");
                      },
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(),
                        ),
                      ),
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
