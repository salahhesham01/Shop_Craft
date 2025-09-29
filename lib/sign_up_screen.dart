import 'package:flutter/material.dart';
import 'package:project/services.dart';

import 'custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();
TextEditingController _nameController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool obscureText = true;

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Account',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Join ShopCraft today',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Name',
              textEditingController: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (value[0] != value[0].toUpperCase()) {
                  return 'Name must start with a capital letter';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Email',
              textEditingController: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Email must contain @';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              hintText: 'Password',
              textEditingController: _passwordController,
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: tooglePassword,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'Confirm Password',
              textEditingController: _confirmPasswordController,
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: tooglePassword,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 40),

            SizedBox(
              height: 48,
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    myDialog(context, 'Account created successfully');
                  }
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tooglePassword() {
    obscureText = !obscureText;
    setState(() {});
  }
}
