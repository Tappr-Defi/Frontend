// Sign Up Screen
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController(text: "Leonard Timothy");
  final _phoneController = TextEditingController(text: "+234 708 123 6789");
  final _businessNameController = TextEditingController(text: "Car Ltd");
  final _passwordController = TextEditingController();
  final _referralController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],),),);
  }
}
    // Form content
    // Expanded(
    // child: SingleChildScrollView(
    // padding: EdgeInsets.symmetric(horizontal: 20),
    // child: Form(
    // key: _formKey,
    // child: Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    // Text(
    // "Empowering small businesses with cost-free, tap-to-pay technology—no hardware needed.",
    // style: TextStyle(
    // color: Colors.grey[600],
    // fontSize: 16,
    // ),
    // ),
    // SizedBox(height: 32),
    // // Full Name
    // CustomTextField(
    // label: "Full Name",
    // controller: _fullNameController,
    // hintText: "Type something...",
    // ),
    // SizedBox(height: 20),
    // // Phone Number
    // CustomTextField(
    // label: "Phone Number",
    // controller: _phoneController,
    // hintText: "Type something...",
    // prefixIcon: Icons.phone,
    // ),
    // SizedBox(height: 20),
    // // Business Name
    // CustomTextField(
    // label: "Business Name",
    // controller: _businessNameController,
    // hintText: "Type something...",
    // ),
    // SizedBox(height: 20),
    // // Password
    // CustomTextField(
    // label: "Password",
    // controller: _passwordController,
    // hintText: "Type something...",
    // obscureText: _obscurePassword,
    // suffixIcon: _obscurePassword ? Icons.visibility_off : Icons.visibility,
    // onSuffixTap: () {
    // setState(() {
    // _obscurePassword = !_obscurePassword;
    // });
    // },
    // ),
    // SizedBox(height: 20),)
    // // Referral Code