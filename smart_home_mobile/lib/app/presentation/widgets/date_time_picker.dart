import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_home_mobile/app/common//utils/date_time.dart';
import 'package:smart_home_mobile/app/presentation/utils/utils.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime initTime;
  final Function(DateTime) onDateChanged;

  const DateTimePicker(
      {Key? key, required this.initTime, required this.onDateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SpaceUtils.spaceSmall),
      child: GestureDetector(
        onTap: () {
          _showDateTimePicker(context);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              IconUtils.edit_calendar,
              height: HeightUtils.iconSizeLarge,
              width: HeightUtils.iconSizeLarge,
              color: ColorUtils.secondaryColor,
            ),
            SizedBox(
              width: SpaceUtils.spaceSmall,
            ),
            Expanded(
              child: Center(
                child: Text(
                    DateTimeUtils.getStringDate(
                        initTime, Pattern.yyyyMMddHHmm_JP),
                    style: StyleUtils.style16Thin),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDateTimePicker(context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime(3000),
      confirmText: 'yes'.tr,
      cancelText: 'cancel'.tr,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: ColorUtils.greenColor),
          ),
          child: child!,
        );
      },
    );

    if (datePicked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
        confirmText: 'yes'.tr,
        cancelText: 'cancel'.tr,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: ColorUtils.greenColor),
            ),
            child: child!,
          );
        },
      );
      if (timePicked != null) {
        final DateTime datetimePicked = DateTime(
            datePicked.year,
            datePicked.month,
            datePicked.day,
            timePicked.hour,
            timePicked.minute);
        onDateChanged(datetimePicked);
      }
    }
  }
}
