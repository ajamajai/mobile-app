import 'package:flutter/material.dart';
import 'package:myapp2/screens/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 62),
              ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
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
                  'Log out',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Card(
                child: ListTile(
                  title: Text('Zadanie 1'),
                  subtitle: Text('Opis zadania'),
                  trailing: Text('2026-01-08')
                ),
              ),
              const Card(
                child: ListTile(
                    title: Text('Zadanie 2'),
                    subtitle: Text('Opis zadania'),
                    trailing: Text('2026-01-07')
                ),
              ),
              const Card(
                child: ListTile(
                    title: Text('Zadanie 3'),
                    subtitle: Text('Opis zadania'),
                    trailing: Text('2026-01-06')
                ),
              )
            ],
          ),
      ),
    );
  }
}
