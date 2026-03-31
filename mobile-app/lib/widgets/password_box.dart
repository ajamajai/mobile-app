import 'package:flutter/material.dart';

class PasswordBox extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final String? errorText;
  const PasswordBox({
    required this.labelText, required this.controller, required this.errorText, super.key,
  });

  @override
  State<PasswordBox> createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: widget.controller,
        obscureText: _obscurePassword,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.errorText,
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
            Icons.lock_outline,
            color: Color(0xFF471AA0),
          ),
          suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
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
    );
  }
}
