import 'package:cineluxe/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController brandController;

  late Animation<Offset> triangleMove;
  late Animation<double> triangleScale;
  late Animation<double> triangleOpacity;

  late Animation<double> textOpacity;

  late Animation<double> brandOpacity;
  late Animation<Offset> brandMove;
  late Animation<double> brandScale;

  String displayedText = "";
  final String fullText = "Cineluxe";

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    brandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    triangleMove = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutCubic),
    );

    triangleScale = Tween<double>(
      begin: 0.6,
      end: 1,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    );

    triangleOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
      ),
    );

    brandOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: brandController, curve: Curves.easeOut),
    );

    brandMove = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: brandController, curve: Curves.easeOutCubic),
    );

    brandScale = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      CurvedAnimation(parent: brandController, curve: Curves.easeOutBack),
    );

    controller.forward();

    Future.delayed(const Duration(milliseconds: 1200), () {
      typeWriter();
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      brandController.forward();
    });

    //  Navigation
    Future.delayed(const Duration(milliseconds: 2800), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnBoardingPage()),
      );
    });
  }

  void typeWriter() async {
    for (int i = 0; i < fullText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      if (!mounted) return;
      setState(() {
        displayedText += fullText[i];
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    brandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: SizedBox.expand(
        child: Column(
          children: [
            const Spacer(),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFFC107),
                          width: 3,
                        ),
                      ),
                    ),

                    SlideTransition(
                      position: triangleMove,
                      child: FadeTransition(
                        opacity: triangleOpacity,
                        child: ScaleTransition(
                          scale: triangleScale,
                          child: CustomPaint(
                            size: const Size(100, 100),
                            painter: TriangleOutlinePainter(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                FadeTransition(
                  opacity: textOpacity,
                  child: Text(
                    displayedText,
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 2,
                      color: Color(0xFFFFC107),
                      shadows: [
                        Shadow(
                          blurRadius: 15,
                          color: Colors.black,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            FadeTransition(
              opacity: brandOpacity,
              child: SlideTransition(
                position: brandMove,
                child: ScaleTransition(
                  scale: brandScale,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "assets/images/brand.png",
                      width: 180,
                      fit: BoxFit.contain,
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

class TriangleOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFC107)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}