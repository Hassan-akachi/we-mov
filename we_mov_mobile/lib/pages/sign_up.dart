// Sign Up Page
import 'package:flutter/material.dart';

import '../utils/constants.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _userType = 'User';
  String _country = 'Nigeria';

  final List<String> countries = [
    'Nigeria',
    'Ghana',
    'Kenya',
    'South Africa',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Implement sign up logic here
      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Phone: ${phoneController.text}');
      print('Country: $_country');
      print('User Type: $_userType');

      // Show success message and navigate to sign in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Colors.lightGreen,
        ),
      );

      Navigator.pushReplacementNamed(context, routeNameSelectTransport);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightGreen.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.directions_bus,
                      size: 40,
                      color: Colors.grey.shade900,
                    ),
                  ),

                  SizedBox(height: 24),

                  // Welcome Text
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Join We Mov today!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  SizedBox(height: 32),

                  // Form Card
                  Card(
                    color: Colors.grey.shade800,
                    elevation: 8,
                    shadowColor: Colors.lightGreen.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Colors.lightGreen.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Full Name Field
                          TextFormField(
                            controller: nameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              hintText: 'Enter your full name',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.person_outline, color: Colors.lightGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16),

                          // Email Field
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.lightGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16),

                          // Phone Field
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              hintText: '+234 000 000 0000',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.phone_outlined, color: Colors.lightGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16),

                          // Country Dropdown
                          DropdownButtonFormField<String>(
                            value: _country,
                            dropdownColor: Colors.grey.shade800,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Country',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              prefixIcon: Icon(Icons.public_outlined, color: Colors.lightGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            items: countries.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _country = value!;
                              });
                            },
                          ),

                          SizedBox(height: 16),

                          // User Type Dropdown
                          DropdownButtonFormField<String>(
                            value: _userType,
                            dropdownColor: Colors.grey.shade800,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Register As',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              prefixIcon: Icon(Icons.badge_outlined, color: Colors.lightGreen),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            items: ['User', 'Admin'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _userType = value!;
                              });
                            },
                          ),

                          SizedBox(height: 16),

                          // Password Field
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Create a password',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.lightGreen),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 16),

                          // Confirm Password Field
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 'Re-enter your password',
                              labelStyle: TextStyle(color: Colors.lightGreen.shade400),
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.lightGreen),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword = !_obscureConfirmPassword;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade700),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade900,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 24),

                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen,
                                foregroundColor: Colors.grey.shade900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 5,
                                shadowColor: Colors.lightGreen.withOpacity(0.5),
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 32),

                  // Sign In Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
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