import 'package:flutter/widgets.dart';
import 'package:test_app/presentation/style/app_spacings.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({
    super.key,
    this.width = AppSpacings.sixteen,
    this.sliver = false,
  });

  final double width;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return sliver
        ? SliverToBoxAdapter(
            child: SizedBox(width: width),
          )
        : SizedBox(width: width);
  }
}
