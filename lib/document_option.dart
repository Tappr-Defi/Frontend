import 'package:flutter/material.dart';

class DocumentOption extends StatefulWidget {
  final IconData icon;
  final String title;

  const DocumentOption({
    required this.icon,
    required this.title,
  });

  @override
  _DocumentOptionState createState() => _DocumentOptionState();
}

class _DocumentOptionState extends State<DocumentOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color(0xFF1E3A5F) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Color(0xFF1E3A5F).withOpacity(0.05) : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFF1E3A5F).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                widget.icon,
                color: Color(0xFF1E3A5F),
                size: 20,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Color(0xFF1E3A5F) : Colors.black,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Color(0xFF1E3A5F),
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}