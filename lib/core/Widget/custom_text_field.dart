import 'package:flutter/material.dart';
import 'package:graduation_project/core/Utils/colors_manager.dart';
import 'package:graduation_project/core/Utils/font_manager.dart';
import 'package:graduation_project/login/presentation/subject_screen.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Controllers to track text input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Validation state
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  // Password visibility
  bool _obscureText = true;

  // Validation methods
  void _validateEmail(String value) {
    setState(() {
      // Simple email validation
      _isEmailValid = value.isNotEmpty && value.contains('@');
    });
  }

  void _validatePassword(String value) {
    setState(() {
      // Password validation (not empty and minimum length)
      _isPasswordValid = value.isNotEmpty && value.length >= 6;
    });
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _emailController,
            onChanged: _validateEmail,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: FontSize.s16, fontWeight: FontWeight.w500),
              hintText: 'Email',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorsManager.blackColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsManager.cayn, width: 2),
              ),
              errorText: _isEmailValid ? null : 'Please enter a valid email',
              errorStyle: TextStyle(color: Colors.red),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _passwordController,
            onChanged: _validatePassword,
            obscureText: _obscureText,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: ColorsManager.blackColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),

              hintStyle: TextStyle(fontSize: FontSize.s16, fontWeight: FontWeight.w500),
              hintText: 'Password',
              //filled: true,
              prefixIcon: Icon(Icons.lock_outline_rounded),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorsManager.blackColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsManager.cayn, width: 2),
              ),
              errorText:
                  _isPasswordValid
                      ? null
                      : 'Password must be at least 6 characters',
              errorStyle: TextStyle(color: Colors.red),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.all(8.0),

          child: ElevatedButton(
            onPressed: () {
              // Final validation before login
              _validateEmail(_emailController.text);
              _validatePassword(_passwordController.text);

              if (_isEmailValid && _isPasswordValid) {
                // Perform login logic
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login Successful')));
                Navigator.pushNamed(context, SubjectScreen.subject);
              }
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: FontSize.s16,
                fontWeight: FontWeightManager.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
