import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_bloc.dart';
import 'package:ringo_media_management/application/user_flow/user_flow/user_flow_state.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/bar_column.dart';

class BarChart extends HookWidget {
  const BarChart({
    super.key,
    required this.months,
    required this.statistics,
    required this.selectedMonth,
  }) : assert(months.length == statistics.length);
  final List<String> months;
  final List<double> statistics;
  final int selectedMonth;

  @override
  Widget build(BuildContext context) {
    final selectedIndexOfMonth = useState(selectedMonth);
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return state.projectPageIsLoadingForProjectsStatisticsModel
            ? ShimmerLoading(
                isLoading: state.projectPageIsLoadingForProjectsStatisticsModel,
                child: SizedBox(
                  width: double.infinity,
                  height: 152.h + 33.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(months.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 152.h * statistics[index],
                            width: ((MediaQuery.of(context).size.width - 48.w - (months.length - 1) * 8) / months.length),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.r),
                                topRight: Radius.circular(8.r),
                              ),
                            ),
                          ),
                          12.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            width: ((MediaQuery.of(context).size.width - 48.w - (months.length - 1) * 8) / months.length),
                            height: 10.h,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              )
            : LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                final spaceBetweenBars = months.length - 1;
                final widthOfBar = (constraints.maxWidth - spaceBetweenBars * 8) / months.length;
                final maxBarHeight = 152.h;
                return SizedBox(
                  height: maxBarHeight + 33.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(months.length, (index) {
                      return BarColumn(
                        onTap: () {
                          selectedIndexOfMonth.value = index;
                        },
                        statisticNumber: statistics[index],
                        widthOfBar: widthOfBar,
                        isSelectedCandle: selectedIndexOfMonth.value == index,
                        monthName: months[index],
                      );
                    }),
                  ),
                );
              });
      },
    );
  }
}
