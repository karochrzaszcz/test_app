import 'package:flutter/widgets.dart';

class AppSpacings {
  const AppSpacings._();

  static const zero = 0.0;

  static const one = 1.0;

  static const two = 2.0;

  static const four = 4.0;

  static const six = 6.0;

  static const eight = 8.0;

  static const ten = 10.0;

  static const twelve = 12.0;

  static const fourteen = 14.0;

  static const sixteen = 16.0;

  static const eighteen = 18.0;

  static const twenty = 20.0;

  static const twentyFour = 24.0;

  static const twentyEight = 28.0;

  static const thirtyTwo = 32.0;

  static const thirtyFour = 34.0;

  static const forty = 40.0;

  static const fortyEight = 48.0;

  static const fiftySix = 56.0;

  static const sixtyFour = 64.0;

  static const sixtyEight = 68.0;

  static const eighty = 80.0;

  static const ninetySix = 96.0;

  static const twoHundred = 200.0;

  /// Returns the bottom padding of the safe area with 16 additional padding.
  /// Make sure that this was called on a widget that is a child of a Scaffold.
  /// Otherwise, it will return only additional 16 padding.
  /// If you want to add more padding, you can pass it as a parameter.
  static double bottomSafePadding(BuildContext context, [double? padding]) {
    return MediaQuery.viewPaddingOf(context).bottom +
        (padding ?? AppSpacings.sixteen);
  }

  static double topSafePadding(BuildContext context, [double? padding]) {
    return MediaQuery.paddingOf(context).top + (padding ?? AppSpacings.sixteen);
  }
}
