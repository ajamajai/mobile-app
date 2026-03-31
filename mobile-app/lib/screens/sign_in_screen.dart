import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/screens/home_screen.dart';
import 'package:myapp2/screens/sign_up_screen.dart';
import 'package:myapp2/widgets/password_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String correctEmail = 'test@test.com';
const String correctPassword = '123456';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 62),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 129,
                height: 129,
              ),
            ),
            const SizedBox(height: 21),
            const Text(
              'Sign In',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 30,
                height: 1,
                letterSpacing: 0,
                color: Color(0xFF471AA0),
              ),
            ),
            const SizedBox(height: 46),
            SizedBox(
              height: 50,
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email or User Name',
                  labelStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.grey[400],
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.20),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                        )
                      ]
                  ),
                  errorText: _emailError,
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF471AA0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFF9747FF),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            PasswordBox(
              labelText: 'Password',
              controller: passwordController,
              errorText: _passwordError,
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  height: 1,
                  letterSpacing: 0,
                  color: Color(0xFF471AA0),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text;

                if (email == correctEmail && password == correctPassword) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', true);

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                  setState(() {
                    _emailError = null;
                    _passwordError = null;
                  });
                } else if (email != correctEmail) {
                  setState(() {
                    _emailError = 'Invalid e-mail';
                    _passwordError = null;
                  });
                } else
                if (email == correctEmail && password != correctPassword) {
                  setState(() {
                    _passwordError = 'Invalid password';
                    _emailError = null;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[300],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 270),
            Align(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have account? ",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      height: 1,
                      letterSpacing: 0,
                      color: Color(0xFF471AA0),
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          height: 1,
                          letterSpacing: 0,
                          color: Color(0xFF471AA0),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
