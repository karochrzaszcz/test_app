import 'package:flutter/material.dart';
import 'package:test_app/presentation/basic_widget/empty.dart';
import 'package:test_app/presentation/basic_widget/vertical_spacer.dart';
import 'package:test_app/presentation/style/app_dimens.dart';
import 'package:test_app/presentation/style/app_spacings.dart';

class NoDataContent extends StatelessWidget {
  const NoDataContent({
    required this.title,
    this.footer,
    super.key,
  });

  final String title;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(AppSpacings.sixteen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          const Icon(
            Icons.money_off_rounded,
            size: AppDimens.iconSizeL,
          ),
          const VerticalSpacer(height: AppSpacings.twelve),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          footer ?? const Empty(),
          const Spacer(),
        ],
      ),
    );
  }
}
