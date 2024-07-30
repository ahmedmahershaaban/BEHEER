import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/presentation/components/notification_bill.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class UserFlowAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserFlowAppBar({super.key, required this.title, required this.subTitle});
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: AppBar(
        // toolbarHeight: 50.h,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: subTitle == null
            ? Text(
                title,
                style: context.font16w700,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.font16w700,
                  ),
                  2.verticalSpace,
                  Text(
                    subTitle!,
                    style: context.font12w400.copyWith(
                      color: kNeutralColors[500],
                    ),
                  )
                ],
              ),
        centerTitle: false,
        actions: [
          NotificationBill(
            onPressed: () {},
          ),
          10.horizontalSpace,
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(24.h),
          child: const Divider(
            height: 1,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
