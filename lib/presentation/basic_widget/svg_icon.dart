import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.assetPath,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    super.key,
  }) : color = null;

  const SvgIcon.withColor({
    required this.assetPath,
    required this.color,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    super.key,
  });

  final String assetPath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    ColorFilter? colorFilter;
    final localColor = color;
    if (localColor != null) {
      colorFilter = ColorFilter.mode(localColor, BlendMode.srcIn);
    }

    return SvgPicture.asset(
      assetPath,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
