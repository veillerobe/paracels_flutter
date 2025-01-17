import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:paracels/data/dummy_data.dart';
import 'package:paracels/themes/themes.dart';
import 'package:paracels/widgets/para_card.dart';

final workDayColor = ParaColors.selection;
final sickLeaveColor = ParaColors.error;
final vacationColor = ParaColors.valid;

class ParaCalendar extends StatelessWidget {
  const ParaCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final workDays = DummyData.workDays;
    final sickLeavesDays = DummyData.sickLeaveDays;
    final vacationDays = DummyData.vocationDays;

    return ParaCard(
      paddingSpacing: ParaSizes.spacing2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              currentDate: DateTime(2023, 6, 16),
              calendarViewMode: CalendarDatePicker2Mode.day,
              weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sat'],
              modePickersGap: 0,
              firstDayOfWeek: 1,
              dayTextStyle: ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w600),
              todayTextStyle: ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w600),
              selectedDayTextStyle:
                  ParaTextStyles.body2.copyWith(fontWeight: FontWeight.w500, color: ParaColors.background),
              centerAlignModePicker: true,
              weekdayLabelTextStyle: ParaTextStyles.body2Bold.copyWith(color: ParaColors.secondary),
              selectedDayHighlightColor: ParaColors.selection,
              calendarViewScrollPhysics: const NeverScrollableScrollPhysics(),
              disableModePicker: true,
              controlsTextStyle: ParaTextStyles.headline3,
              dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
                final isWorkDay = workDays.contains(date);
                final isSickLeaveDay = sickLeavesDays.contains(date);
                final isVacationDay = vacationDays.contains(date);

                if (!isWorkDay && !isSickLeaveDay && !isVacationDay) {
                  return null;
                }

                Color? pointColor() {
                  if (isWorkDay) {
                    return workDayColor;
                  }
                  if (isSickLeaveDay) {
                    return sickLeaveColor;
                  }
                  if (isVacationDay) {
                    return vacationColor;
                  }
                  return null;
                }

                return Container(
                  decoration: decoration,
                  child: Center(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Text(
                          MaterialLocalizations.of(context).formatDecimal(date.day),
                          style: textStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 27.5),
                          child: Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: pointColor(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            displayedMonthDate: DateTime(2023, 6, 16),
            value: [DateTime(2023, 6, 16)],
          ),
          Padding(
            padding: const EdgeInsets.all(ParaSizes.spacing24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: workDayColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Work day', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: sickLeaveColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Sick leave', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: vacationColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text('Vacation', style: ParaTextStyles.body3)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
