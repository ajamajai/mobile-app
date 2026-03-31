import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp2/screens/sign_in_screen.dart';
import 'package:myapp2/widgets/password_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 59),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color(0xFF471AA0),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      height: 1,
                      letterSpacing: 0,
                      color: Color(0xFF471AA0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 101),
                  const Text(
                    'Sign Up',
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
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
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
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                        prefixIcon: const Icon(
                          Icons.email_outlined,
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
                    errorText: null,
                  ),
                  const SizedBox(height: 40),
                  PasswordBox(
                    labelText: 'Confirm password',
                    controller: passwordController,
                    errorText: null,
                  ),
                  const SizedBox(height: 80),
                  ElevatedButton(
                    onPressed: () {
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
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 140),
                  Align(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            height: 1,
                            letterSpacing: 0,
                            color: Color(0xFF471AA0),
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
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
                                      builder: (context) => const SignInScreen(),
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
          ],
        ),
      ),
    );
  }
}
