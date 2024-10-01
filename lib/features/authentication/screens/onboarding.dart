import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            // Páginas desplazables horizontalmente
            PageView(
              children: const [
                Column(
                  // Image(image: AssetImage(TImage.onBoardingImage1),)
                )
            



              ],
            ),


            // botón de omitir

            // navegador de puntos smoothpageindicator

            // botón circular
        ],
      ),
    );
  }
}

