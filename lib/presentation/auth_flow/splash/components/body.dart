import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/core/app_config.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                appConfig.iconAssets,
                width: 50.w,
                height: 50.h,
              ),
              24.verticalSpace,
              Text(
                appConfig.appTitle,
                style: context.font14w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
