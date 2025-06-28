import 'package:flutter/material.dart';

class TapprTextField extends StatelessWidget {
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

  const TapprTextField({
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