import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media_management/domain/core/value_objects.dart';
import 'package:ringo_media_management/presentation/core/extensions/text_theme_extensions.dart';
import 'package:ringo_media_management/presentation/core/themes/app_themes.dart';

class SelectColorForm extends HookWidget {
  const SelectColorForm({
    super.key,
    required this.title,
    required this.onChangeColor,
  });
  final String title;
  final Function(Color) onChangeColor;
  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.font14w600,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 45.h,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selectedIndex.value = index;
                      onChangeColor(ValidatedColor.predefinedColors[index]);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        border: selectedIndex.value == index
                            ? Border.all(
                                color: kNeutralColors[600]!,
                                width: 3,
                              )
                            : Border.all(color: ValidatedColor.predefinedColors[index]),
                        color: ValidatedColor.predefinedColors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                  itemCount: ValidatedColor.predefinedColors.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
