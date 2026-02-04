import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scanner_app/screens/cashier/cashier_screen.dart';
import 'package:scanner_app/screens/scanner/scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // desert image
          Positioned.fill(
            child: Image.asset(
              'assets/desert.png',
              fit: BoxFit.cover,
            ),
          ),

          // gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
            ),
          ),

          // content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80),


                  

                  // cafe title
ShaderMask(
  shaderCallback: (bounds) {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFF4A261), // warm orange
        Color(0xFFE6D3A3), // sand gold
      ],
    ).createShader(bounds);
  },
  child: Text(
    "What You Want.",
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.3,
      color: Colors.white, // wajib putih
    ),
  ),
),


                   SizedBox(height: 4),

                 Text(
  "Coffee Shop",
  style: TextStyle(
    fontFamily: 'Playfair',
    fontSize: 44,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: Color(0xFFE6D3A3),
    
  
  ),
),


            

                  const Spacer(),

                  // glass card
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          children: [
                            _DesertMenuButton(
                              title: "Counter",
                              subtitle: "Create order & print receipt",
                              icon: Icons.point_of_sale_rounded,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CashierScreen(),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 18),

                            _DesertMenuButton(
                              title: "Order",
                              subtitle: "Scan QR & order instantly",
                              icon: Icons.qr_code_scanner_rounded,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ScannerScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: Text(
                      "v1.0.0 • Desert LA Edition",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Button
class _DesertMenuButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _DesertMenuButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFF1F1F1F).withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFFF4A261), size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFFE6D3A3),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
