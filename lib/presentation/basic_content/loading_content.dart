import 'package:flutter/material.dart';
import 'package:test_app/presentation/style/app_dimens.dart';

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingIndicator = SizedBox(
      width: AppDimens.loadingIndicatorSize,
      height: AppDimens.loadingIndicatorSize,
      child: CircularProgressIndicator(),
    );

    return const Center(child: loadingIndicator);
  }
}
