import 'package:flutter/material.dart';
import 'package:tappr/signup_screen.dart';

import 'document_option.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Verify your identity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To help you keep your money safe and secure, we are required by the financial law to verify your identity.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "Select Document-type",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "The following document listed below are the government issued ID available in this region.",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Document options
                    const DocumentOption(
                      icon: Icons.credit_card,
                      title: "National Identity Number - NIN",
                    ),
                    const SizedBox(height: 16),
                    const DocumentOption(
                      icon: Icons.account_balance,
                      title: "Bank Verification Number - BVN",
                    ),
                    const SizedBox(height: 16),
                    const DocumentOption(
                      icon: Icons.description,
                      title: "Passport",
                    ),
                    const SizedBox(height: 16),
                    const DocumentOption(
                      icon: Icons.directions_car,
                      title: "Drivers License",
                    ),
                    // Add some bottom padding to ensure content doesn't get hidden behind the button
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            // Fixed Continue button at bottom
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E3A5F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}