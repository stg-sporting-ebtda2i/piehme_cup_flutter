import 'package:flutter/material.dart';
import 'package:piehme_cup_flutter/routes/app_routes.dart';
import 'package:piehme_cup_flutter/widgets/widgets_button.dart';
import 'package:piehme_cup_flutter/widgets/widgets_text_field.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    // Validate inputs
    if (_usernameController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
        ),
      );
      return;
    }

    // Start loading
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    // try {
      // final bool isLoginSuccessful = await AuthService.login(
      //   _usernameController.text.trim(),
      //   _passwordController.text.trim(),
      // );
      //
      // if (isLoginSuccessful) {
      //   // Retrieve role and navigate if successful
      //   final role = await AuthService.getRole();
      //   if (role == 'WALAD') {
      //     if (!mounted) return;
          Navigator.pushReplacementNamed(context, AppRoutes.home);
    //     } else {
    //       if (!mounted) return;
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           content: Text('Invalid role'),
    //         ),
    //       );
    //     }
    //   } else {
    //     if (!mounted) return;
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Login failed: Incorrect username or password'),
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   if (!mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Login failed: ${e.toString()}'),
    //     ),
    //   );
    // } finally {
    //   // Stop loading
    //   if (mounted) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Image(
            image: AssetImage('assets/other_background.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 25),
                  loginTextField(
                    controller: _usernameController,
                    hint: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  loginTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    width: 220,
                    height: 55,
                    text: 'Login',
                    isLoading: _isLoading,
                    onClick: login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}