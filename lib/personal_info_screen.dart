import 'package:flutter/material.dart';
import 'package:tappr/tappr_text_field.dart';
import 'identity_verification_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();
  final _addressController = TextEditingController();
  final _zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Personal Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fill in the following information to get started with Tappr today!",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // First Name
                      CustomTextField(
                        label: "First Name",
                        controller: _firstNameController,
                        hintText: "Enter your first name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Last Name
                      CustomTextField(
                        label: "Last Name",
                        controller: _lastNameController,
                        hintText: "Enter your last name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Date of Birth
                      CustomTextField(
                        label: "Date of Birth",
                        controller: _dobController,
                        hintText: "Select your date of birth",
                        suffixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              _dobController.text = "${date.day}/${date.month}/${date.year}";
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Gender
                      TapprTextField(
                        label: "Gender",
                        controller: _genderController,
                        hintText: "Select your gender",
                        suffixIcon: Icons.keyboard_arrow_down,
                        readOnly: true,
                        onTap: () {
                          _showGenderPicker();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // House Address
                      CustomTextField(
                        label: "House Address",
                        controller: _addressController,
                        hintText: "Enter your house address",
                        maxLines: 2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your house address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Zip Code
                      CustomTextField(
                        label: "Zip Code",
                        controller: _zipCodeController,
                        hintText: "Enter your zip code",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your zip code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            // Continue button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const IdentityVerificationScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A5F),
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

  void _showGenderPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select Gender",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text("Male"),
                leading: const Icon(Icons.male),
                onTap: () {
                  setState(() {
                    _genderController.text = "Male";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Female"),
                leading: const Icon(Icons.female),
                onTap: () {
                  setState(() {
                    _genderController.text = "Female";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Other"),
                leading: const Icon(Icons.transgender),
                onTap: () {
                  setState(() {
                    _genderController.text = "Other";
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }
}

// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool enabled;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.hintText = "",
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.fillColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        // Text Field
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          enabled: enabled,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            hintText: hintText.isEmpty ? "Type something..." : hintText,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
            filled: true,
            fillColor: fillColor ?? Colors.grey[50],
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? Icon(
              suffixIcon,
              color: Colors.grey[600],
              size: 20,
            )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF1E3A5F),
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}