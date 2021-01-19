import 'package:desafiobtg/Util/TamanhoTela.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TamanhoWidgets {
  static paddingInput(context) {
    return getValueForScreenType<double>(
      context: context,
      mobile: 20,
      tablet: 35,
      desktop: 38,
    );
  }

  static header(context) {
    return getValueForScreenType<double>(
      context: context,
      mobile: 80,
      tablet: TamanhoTela.height(context, 0.07),
      desktop: TamanhoTela.height(context, 0.03),
    );
  }

  static botoesLargura(context) {
    return getValueForScreenType<double>(
        context: context, mobile: TamanhoTela.width(context, 1.0), tablet: 60, desktop: 55);
  }

  static botoesAltura(context) {
    return getValueForScreenType<double>(context: context, mobile: 60, tablet: 60, desktop: 55);
  }

  static double espacamento = 15.0;
}