import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/extensions/theme_mode_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/core/utilities.dart';

class ScheduleBigCard extends StatelessWidget {
  const ScheduleBigCard({
    super.key,
    required this.numberOfLinks,
    required this.numberOfComments,
    required this.numberOfMembersSvgsAssets,
    required this.color,
    required this.title,
    required this.subTitle,
    required this.startDate,
    required this.endDate,
    required this.location,
  });

  final int numberOfLinks;
  final int numberOfComments;
  final List<int> numberOfMembersSvgsAssets;
  final Color color;
  final String title;
  final String subTitle;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: context.isDarkMode ? kNeutralColorsDarkMode[700]! : kNeutralColors[0],
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00000014).withOpacity(0.08),
            offset: const Offset(4, 8),
            blurRadius: 24,
          )
        ],
        border: Border(
          left: BorderSide(color: color, width: 6.w),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: numberOfMembersSvgsAssets.map(
                  (number) {
                    if (number < 5) {
                      return Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: SvgPicture.asset(
                          'assets/svgs/home_team_workspace/$number.svg',
                          width: 24,
                          height: 24,
                        ),
                      );
                    } else if (number == 5) {
                      return Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/empty_profile.svg',
                            width: 24,
                            height: 24,
                          ),
                          Positioned(left: 8, top: 1, child: Text((numberOfMembersSvgsAssets.length - 5).toString())),
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ).toList(),
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/link.svg',
                    semanticsLabel: 'link',
                  ),
                  2.horizontalSpace,
                  Text(
                    numberOfLinks.toString(),
                    style: context.font12w500.copyWith(
                      color: kNeutralColors[500],
                    ),
                  ),
                ],
              ),
              10.horizontalSpace,
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/message.svg',
                    semanticsLabel: 'message',
                  ),
                  2.horizontalSpace,
                  Text(
                    numberOfComments.toString(),
                    style: context.font12w500.copyWith(
                      color: kNeutralColors[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            title,
            style: context.font14w600,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          8.verticalSpace,
          Text(
            subTitle,
            style: context.font12w500.copyWith(
              color: kNeutralColors[500],
            ),
          ),
          8.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/clock_light.svg',
                semanticsLabel: 'clock',
              ),
              8.horizontalSpace,
              Text(
                '${extractHourWithPrefixFromDateTime(startDate)} - ${extractHourWithPrefixFromDateTime(endDate)}',
                style: context.font12w500.copyWith(
                  color: kNeutralColors[500],
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgs/location.svg',
                semanticsLabel: 'location',
              ),
              8.horizontalSpace,
              Text(
                'Aksantara Office',
                style: context.font12w500.copyWith(
                  color: kNeutralColors[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
