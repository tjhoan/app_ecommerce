import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // Variables

  // Actualizar el índice actual cuando se desplaza la página
  void updatePageIndicator(int index) {}

  // Saltar a la página específica seleccionada por el punto
  void dotNavigationClick(index) {}

  // Actualizar el índice actual y saltar a la siguiente página
  void nextPage() {}

  // Actualizar el índice actual y saltar a la última página
  void shipPage() {}
}
