// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/enums/button_type.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Package imports:

// Project imports:

class CalendarPickerDialog extends StatefulWidget {
  final Function onChanged;
  final DateTime? initDateTime;
  final DateTime? minDate;
  final DateTime? lastDate;
  final DateRangePickerSelectionMode selectionMode;
  final PickerDateRange? initDateRange;

  const CalendarPickerDialog({
    super.key,
    required this.onChanged,
    this.initDateTime,
    this.minDate,
    this.lastDate,
    this.selectionMode = DateRangePickerSelectionMode.single,
    this.initDateRange,
  });

  @override
  State<CalendarPickerDialog> createState() => _CalendarPickerDialogState();
}

class _CalendarPickerDialogState extends State<CalendarPickerDialog> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppColors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
            minDate: widget.minDate ?? DateTime(1970, 1, 1),
            selectionShape: DateRangePickerSelectionShape.rectangle,
            showActionButtons: false,
            showNavigationArrow: true,
            initialSelectedRange: widget.initDateRange,
            initialSelectedDate: widget.initDateTime,
            initialDisplayDate: widget.initDateTime,
            todayHighlightColor: AppColors.primary600,
            startRangeSelectionColor: AppColors.primary600,
            endRangeSelectionColor: AppColors.primary600,
            selectionMode: widget.selectionMode,
            selectionTextStyle: AppTextStyle.textGray90014W500.copyWith(color: Colors.white),
            selectionColor: AppColors.primary500,
            rangeTextStyle: AppTextStyle.textGray90014W500,
            rangeSelectionColor: AppColors.primary100,
            maxDate: widget.lastDate ?? DateTime(2100, 1, 1),
            headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: AppTextStyle.textGray90016W600,
                backgroundColor: AppColors.white),
            backgroundColor: AppColors.white,
            yearCellStyle: DateRangePickerYearCellStyle(
              todayCellDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.white,
              ),
              textStyle: AppTextStyle.textGray90014W400,
              todayTextStyle: AppTextStyle.textGray90014W400,
            ),
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: AppTextStyle.textGray90014W400,
              todayTextStyle: AppTextStyle.textGray90014W500,
              blackoutDatesDecoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            monthViewSettings: DateRangePickerMonthViewSettings(
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: AppTextStyle.textGray80012W500,
                  backgroundColor: AppColors.white),
            ),
            onSelectionChanged: (args) {
              if (args.value is PickerDateRange) {
              } else if (args.value is DateTime) {
                final DateTime selectedDate = args.value;
              } else if (args.value is List<DateTime>) {
              } else {}
              // Navigator.pop(context);
            },
            // selectionRadius: -1,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppButton(
                  type: ButtonType.white,
                  radius: BorderRadius.circular(9999),
                  label: i18n.CommonAction.Cancel,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: AppButton(
                  label: i18n.CommonAction.Confirm,
                  radius: BorderRadius.circular(9999),
                  onPressed: () {
                    Navigator.of(context).pop(true);

                    widget.onChanged(widget.selectionMode ==
                            DateRangePickerSelectionMode.single
                        ? _controller.selectedDate
                        : _controller.selectedRange);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
