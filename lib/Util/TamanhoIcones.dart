import 'package:responsive_builder/responsive_builder.dart';

class TamanhoIcones {
  static double pequeno(context) {
    return 25;
  }

  static double medio(context) {
    return 40;
  }

  static double grande(context) {
    return getValueForScreenType<double>(
      context: context,
      mobile: 50,
      tablet: 50,
      desktop: 50,
    );
  }
}