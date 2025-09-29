import 'package:flutter/material.dart';
import 'package:project/services.dart';

import 'custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool obscureText = true;
final _formKey = GlobalKey<FormState>();

class _SignInScreenState extends State<SignInScreen> {
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
              'Welcome Back',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sign in to ShopCraft',
              style: TextStyle(color: Colors.black, fontSize: 16),
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
                    myDialog(context, 'Account sign-in successfully');
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text('Please enter valid data'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'SignIn',
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
