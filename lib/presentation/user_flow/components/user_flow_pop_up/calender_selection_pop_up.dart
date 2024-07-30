import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/calender_number_button.dart';

final List<String> daysFirstLetter = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

class CalenderSelectionPopUp extends HookWidget {
  const CalenderSelectionPopUp({
    super.key,
    required this.buttonText,
    required this.initialDate,
  });
  final String buttonText;
  final DateTime initialDate;

  @override
  Widget build(BuildContext context) {
    final selectedDateTime = useState(initialDate);

    final currentDateTime = useState(DateTime.now());
    final numberOfDaysInSelectedMonth = useState(
      DTU.getDaysInMonth(currentDateTime.value.year, currentDateTime.value.month),
    );
    final previousMonthForCurrentMonth = useState(DateTime(
      currentDateTime.value.month == 1 ? currentDateTime.value.year - 1 : currentDateTime.value.year,
      currentDateTime.value.month == 1 ? 12 : currentDateTime.value.month - 1,
      1,
    ));
    final nextMonthForCurrentMonth = useState(DateTime(
      currentDateTime.value.month == 12 ? currentDateTime.value.year + 1 : currentDateTime.value.year,
      currentDateTime.value.month == 12 ? 1 : currentDateTime.value.month + 1,
      1,
    ));
    final numberOfDaysInPreviousMonth = useState(
      DTU.getDaysInMonth(previousMonthForCurrentMonth.value.year, previousMonthForCurrentMonth.value.month),
    );

    final firstDayForCurrentMoth = useState(
      DateTime(currentDateTime.value.year, currentDateTime.value.month),
    );
    final listOfDisplayedDays = useState(<DateTime>[]);
    final numberOfDaysWillBeShownFromPreviousMonth = useState(0);
    final numberOfDaysWillBeShownFromNextMonth = useState(0);

    useEffect(() {
      final List<DateTime> numberOfDaysToBeDisplayedWithGrid = [];

      /// if this got [0] then the month will start from the first day of the calender
      /// if it was [1] then monday will be form the last month
      numberOfDaysWillBeShownFromPreviousMonth.value = firstDayForCurrentMoth.value.weekday - 1;
      for (int i = numberOfDaysWillBeShownFromPreviousMonth.value - 1; i >= 0; i--) {
        numberOfDaysToBeDisplayedWithGrid.add(
          DateTime(
            previousMonthForCurrentMonth.value.year,
            previousMonthForCurrentMonth.value.month,
            numberOfDaysInPreviousMonth.value - i,
          ),
        );
      }
      for (int i = 1; i < numberOfDaysInSelectedMonth.value + 1; i++) {
        numberOfDaysToBeDisplayedWithGrid.add(
          DateTime(
            currentDateTime.value.year,
            currentDateTime.value.month,
            i,
          ),
        );
      }
      numberOfDaysWillBeShownFromNextMonth.value = 35 - numberOfDaysToBeDisplayedWithGrid.length;
      for (int i = 1; i <= numberOfDaysWillBeShownFromNextMonth.value; i++) {
        numberOfDaysToBeDisplayedWithGrid.add(DateTime(
          nextMonthForCurrentMonth.value.year,
          nextMonthForCurrentMonth.value.month,
          i,
        ));
      }
      listOfDisplayedDays.value = numberOfDaysToBeDisplayedWithGrid;
      return null;
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 603.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kNeutralColors[0],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            children: [
              14.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Choose Date',
                          style: context.font16w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.router.maybePop(null);
                      },
                      icon: Icon(
                        Icons.close,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: kNeutralColors[200],
              ),
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      daysFirstLetter.length,
                      (index) => Text(
                            daysFirstLetter[index],
                            style: context.font16w600,
                          )),
                ),
              ),
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        currentDateTime.value = previousMonthForCurrentMonth.value;
                        numberOfDaysInSelectedMonth.value = DTU.getDaysInMonth(currentDateTime.value.year, currentDateTime.value.month);
                        previousMonthForCurrentMonth.value = DateTime(
                          currentDateTime.value.month == 1 ? currentDateTime.value.year - 1 : currentDateTime.value.year,
                          currentDateTime.value.month == 1 ? 12 : currentDateTime.value.month - 1,
                          1,
                        );
                        nextMonthForCurrentMonth.value = DateTime(
                          currentDateTime.value.month == 12 ? currentDateTime.value.year + 1 : currentDateTime.value.year,
                          currentDateTime.value.month == 12 ? 1 : currentDateTime.value.month + 1,
                          1,
                        );
                        numberOfDaysInPreviousMonth.value =
                            DTU.getDaysInMonth(previousMonthForCurrentMonth.value.year, previousMonthForCurrentMonth.value.month);

                        firstDayForCurrentMoth.value = DateTime(currentDateTime.value.year, currentDateTime.value.month);

                        listOfDisplayedDays.value = <DateTime>[];
                        numberOfDaysWillBeShownFromPreviousMonth.value = 0;
                        numberOfDaysWillBeShownFromNextMonth.value = 0;

                        List<DateTime> numberOfDaysToBeDisplayedWithGrid = [];

                        /// if this got [0] then the month will start from the first day of the calender
                        /// if it was [1] then monday will be form the last month
                        numberOfDaysWillBeShownFromPreviousMonth.value = firstDayForCurrentMoth.value.weekday - 1;
                        for (int i = numberOfDaysWillBeShownFromPreviousMonth.value - 1; i >= 0; i--) {
                          numberOfDaysToBeDisplayedWithGrid.add(
                            DateTime(
                              previousMonthForCurrentMonth.value.year,
                              previousMonthForCurrentMonth.value.month,
                              numberOfDaysInPreviousMonth.value - i,
                            ),
                          );
                        }
                        for (int i = 1; i < numberOfDaysInSelectedMonth.value + 1; i++) {
                          numberOfDaysToBeDisplayedWithGrid.add(
                            DateTime(
                              currentDateTime.value.year,
                              currentDateTime.value.month,
                              i,
                            ),
                          );
                        }
                        numberOfDaysWillBeShownFromNextMonth.value = 35 - numberOfDaysToBeDisplayedWithGrid.length;
                        for (int i = 1; i <= numberOfDaysWillBeShownFromNextMonth.value; i++) {
                          numberOfDaysToBeDisplayedWithGrid.add(DateTime(
                            nextMonthForCurrentMonth.value.year,
                            nextMonthForCurrentMonth.value.month,
                            i,
                          ));
                        }
                        listOfDisplayedDays.value = numberOfDaysToBeDisplayedWithGrid;
                      },
                      icon: SvgPicture.asset(
                        'assets/svgs/arrow_left.svg',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    Text(
                      DateFormat('MMM yyyy').format(currentDateTime.value),
                      style: context.font16w600,
                    ),
                    IconButton(
                      onPressed: () {
                        currentDateTime.value = nextMonthForCurrentMonth.value;
                        numberOfDaysInSelectedMonth.value = DTU.getDaysInMonth(currentDateTime.value.year, currentDateTime.value.month);
                        previousMonthForCurrentMonth.value = DateTime(
                          currentDateTime.value.month == 1 ? currentDateTime.value.year - 1 : currentDateTime.value.year,
                          currentDateTime.value.month == 1 ? 12 : currentDateTime.value.month - 1,
                          1,
                        );
                        nextMonthForCurrentMonth.value = DateTime(
                          currentDateTime.value.month == 12 ? currentDateTime.value.year + 1 : currentDateTime.value.year,
                          currentDateTime.value.month == 12 ? 1 : currentDateTime.value.month + 1,
                          1,
                        );
                        numberOfDaysInPreviousMonth.value =
                            DTU.getDaysInMonth(previousMonthForCurrentMonth.value.year, previousMonthForCurrentMonth.value.month);

                        firstDayForCurrentMoth.value = DateTime(currentDateTime.value.year, currentDateTime.value.month);

                        listOfDisplayedDays.value = <DateTime>[];
                        numberOfDaysWillBeShownFromPreviousMonth.value = 0;
                        numberOfDaysWillBeShownFromNextMonth.value = 0;

                        List<DateTime> numberOfDaysToBeDisplayedWithGrid = [];

                        /// if this got [0] then the month will start from the first day of the calender
                        /// if it was [1] then monday will be form the last month
                        numberOfDaysWillBeShownFromPreviousMonth.value = firstDayForCurrentMoth.value.weekday - 1;
                        for (int i = numberOfDaysWillBeShownFromPreviousMonth.value - 1; i >= 0; i--) {
                          numberOfDaysToBeDisplayedWithGrid.add(
                            DateTime(
                              previousMonthForCurrentMonth.value.year,
                              previousMonthForCurrentMonth.value.month,
                              numberOfDaysInPreviousMonth.value - i,
                            ),
                          );
                        }
                        for (int i = 1; i < numberOfDaysInSelectedMonth.value + 1; i++) {
                          numberOfDaysToBeDisplayedWithGrid.add(
                            DateTime(
                              currentDateTime.value.year,
                              currentDateTime.value.month,
                              i,
                            ),
                          );
                        }
                        numberOfDaysWillBeShownFromNextMonth.value = 35 - numberOfDaysToBeDisplayedWithGrid.length;
                        for (int i = 1; i <= numberOfDaysWillBeShownFromNextMonth.value; i++) {
                          numberOfDaysToBeDisplayedWithGrid.add(DateTime(
                            nextMonthForCurrentMonth.value.year,
                            nextMonthForCurrentMonth.value.month,
                            i,
                          ));
                        }
                        listOfDisplayedDays.value = numberOfDaysToBeDisplayedWithGrid;
                      },
                      icon: SvgPicture.asset(
                        'assets/svgs/arrow_right.svg',
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: GridView.count(
                    crossAxisCount: 7,
                    // crossAxisCount: listOfDisplayedDays.value.length,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    children: List.generate(listOfDisplayedDays.value.length, (index) {
                      return CalenderNumberButton(
                        dateTime: listOfDisplayedDays.value[index],
                        isActive: listOfDisplayedDays.value[index].month == currentDateTime.value.month,
                        isSelected: DTU.isSameDay(
                          selectedDateTime.value,
                          listOfDisplayedDays.value[index],
                        ),
                        onlClicked: () {
                          selectedDateTime.value = listOfDisplayedDays.value[index];
                        },
                      );
                    }),
                  ),
                ),
              ),
              14.verticalSpace,
              Divider(
                color: kNeutralColors[200],
              ),
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                  onPressed: () {
                    context.maybePop(selectedDateTime.value);
                  },
                  child: Text(
                    buttonText,
                    style: context.font16w700.copyWith(
                      color: kNeutralColors[0],
                    ),
                  ),
                ),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
