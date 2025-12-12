import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to LawCRM",
      "subtitle":
          "Your smart assistant to manage legal clients, cases, and documents efficiently.",
      "image": "assets/images/law1.png"
    },
    {
      "title": "Organize Everything",
      "subtitle":
          "Track all client information, court dates, and contracts in one place.",
      "image": "assets/images/law2.png"
    },
    {
      "title": "Boost Productivity",
      "subtitle":
          "Save time with automation and focus on what matters — your clients.",
      "image": "assets/images/law3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.mainGradient),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) => _buildPage(
                    onboardingData[index]["title"]!,
                    onboardingData[index]["subtitle"]!,
                    onboardingData[index]["image"]!,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => _buildDot(index),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _goToLogin(context);
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ).copyWith(
                              backgroundColor: WidgetStateProperty.all(null),
                            ),
                            onPressed: () {
                              if (currentPage == onboardingData.length - 1) {
                                _goToLogin(context);
                              } else {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: AppTheme.buttonGradient,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  currentPage == onboardingData.length - 1
                                      ? "Get Started"
                                      : "Next",
                                  style: const TextStyle(
                                      color: AppTheme.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Editing welcome page start
  Widget _buildPage(String title, String subtitle, String imagePath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: currentPage == index ? 24 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? AppTheme.accentPurple : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }
}
