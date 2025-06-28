import 'package:flutter/material.dart';

import 'personal_info_screen.dart';

void main() {
  runApp(TapprApp());
}

class TapprApp extends StatelessWidget {
  const TapprApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tappr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1E3A5F),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      title: "Tappr: Payments, Simplified.",
      description: "Empowering small businesses with cost-free, tap-to-pay technology—no hardware needed.",
      illustration: OnboardingIllustration1(),
    ),
    OnboardingData(
      title: "Trust, Backed by Blockchain.",
      description: "Tappr leverages blockchain transparency to ensure every transaction is secure.",
      illustration: OnboardingIllustration2(),
    ),
    OnboardingData(
      title: "Reliable performance, even low connectivity.",
      description: "Tappr delivers Steady in low-connectivity zones.",
      illustration: OnboardingIllustration3(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Status bar and skip button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "9:41",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.signal_cellular_4_bar, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            // Skip button
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
            // Onboarding content
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        // Illustration
                        Expanded(
                          flex: 2,
                          child: onboardingData[index].illustration,
                        ),
                        SizedBox(height: 40),
                        // Title
                        Text(
                          onboardingData[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Description
                        Text(
                          onboardingData[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? const Color(0xFF1E3A5F)
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Continue button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
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
            const SizedBox(height: 20),
            // Home indicator
            Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class OnboardingIllustration1 extends StatelessWidget {
  const OnboardingIllustration1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8E5FF),
                  Color(0xFFF0F8FF),
                ],
              ),
            ),
          ),
          // Profile images and connections
          Center(
            child: Stack(
              children: [
                // Profile images positioned around
                const Positioned(
                  top: 50,
                  left: 50,
                  child: ProfileAvatar(),
                ),
                const Positioned(
                  top: 80,
                  right: 60,
                  child: ProfileAvatar(),
                ),
                const Positioned(
                  bottom: 120,
                  left: 40,
                  child: ProfileAvatar(),
                ),
                const Positioned(
                  bottom: 80,
                  right: 50,
                  child: ProfileAvatar(),
                ),
                // Center profile with labels
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Tap to Pay",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const ProfileAvatar(size: 80),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Tap to Receive",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingIllustration2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8E5FF),
                  Color(0xFFE0F8F8),
                ],
              ),
            ),
          ),
          // Ethereum symbol and profiles
          Center(
            child: Stack(
              children: [
                // Ethereum symbol in center
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        child: CustomPaint(
                          painter: EthereumPainter(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Profile avatars around the center
                Positioned(
                  top: 40,
                  left: 80,
                  child: ProfileAvatar(),
                ),
                Positioned(
                  top: 60,
                  right: 70,
                  child: ProfileAvatar(),
                ),
                Positioned(
                  bottom: 60,
                  left: 60,
                  child: ProfileAvatar(),
                ),
                Positioned(
                  bottom: 40,
                  right: 80,
                  child: ProfileAvatar(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingIllustration3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE8E5FF),
                  Color(0xFFF0F8FF),
                ],
              ),
            ),
          ),
          // Profile images with connectivity indicators
          Center(
            child: Stack(
              children: [
                // Profile avatars with wifi signals
                Positioned(
                  top: 60,
                  left: 60,
                  child: Column(
                    children: [
                      ProfileAvatar(),
                      SizedBox(height: 8),
                      Icon(Icons.wifi, color: Colors.green, size: 20),
                      Text(
                        "High Connectivity",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 60,
                  child: Column(
                    children: [
                      ProfileAvatar(),
                      SizedBox(height: 8),
                      Icon(Icons.wifi_off, color: Colors.orange, size: 20),
                      Text(
                        "Low Connectivity",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 80,
                  child: Column(
                    children: [
                      ProfileAvatar(),
                      SizedBox(height: 8),
                      Icon(Icons.wifi_1_bar, color: Colors.orange, size: 20),
                      Text(
                        "Low Connectivity",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Container(
          color: Colors.grey[400],
          child: Icon(
            Icons.person,
            size: size * 0.6,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class EthereumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF627EEA)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Simplified Ethereum diamond shape
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width * 0.8, size.height * 0.4);
    path.lineTo(size.width / 2, size.height * 0.6);
    path.lineTo(size.width * 0.2, size.height * 0.4);
    path.close();

    canvas.drawPath(path, paint);

    final path2 = Path();
    path2.moveTo(size.width / 2, size.height * 0.6);
    path2.lineTo(size.width * 0.8, size.height * 0.4);
    path2.lineTo(size.width / 2, size.height);
    path2.lineTo(size.width * 0.2, size.height * 0.4);
    path2.close();

    paint.color = Color(0xFF627EEA).withOpacity(0.6);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OnboardingData {
  final String title;
  final String description;
  final Widget illustration;

  OnboardingData({
    required this.title,
    required this.description,
    required this.illustration,
  });
}

