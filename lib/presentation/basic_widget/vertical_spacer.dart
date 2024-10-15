import 'package:flutter/widgets.dart';
import 'package:test_app/presentation/style/app_spacings.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer({
    super.key,
    this.height = AppSpacings.sixteen,
    this.sliver = false,
  });

  final double height;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return sliver
        ? SliverToBoxAdapter(child: SizedBox(height: height))
        : SizedBox(height: height);
  }
}
