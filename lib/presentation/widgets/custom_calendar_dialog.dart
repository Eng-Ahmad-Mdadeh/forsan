// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:tamalok/core/resources/app_colors.dart';
// import 'package:tamalok/core/resources/app_fonts.dart';
// import 'package:tamalok/core/resources/app_values.dart';
// import 'package:tamalok/presentation/widgets/custom_elevated_button.dart';
// import 'package:tamalok/presentation/widgets/text/body_title.dart';
//
// /// يعرض حوار اختيار نطاق تاريخ باستخدام TableCalendar.
// /// يعيد DateTimeRange عند التأكيد، أو null عند الإلغاء.
// Future<DateTimeRange?> showDateRangePickerDialog(
//   BuildContext context, {
//   DateTime? initialStart,
//   DateTime? initialEnd,
//   DateTime? minimumDate,
//   RangeSelectionMode? rangeSelectionMode,
// }) {
//   final now = DateTime.now();
//   final minSelectableDate = minimumDate != null
//       ? DateTime(minimumDate.year, minimumDate.month, minimumDate.day)
//       : DateTime(now.year, now.month, now.day);
//   DateTime focusedDay = initialStart ?? minSelectableDate;
//   DateTime? rangeStart = initialStart;
//   DateTime? rangeEnd = initialEnd;
//
//   if (rangeStart != null && rangeStart.isBefore(minSelectableDate)) {
//     rangeStart = minSelectableDate;
//   }
//   if (rangeEnd != null && rangeEnd.isBefore(rangeStart!)) {
//     rangeEnd = rangeStart;
//   }
//
//   return showDialog<DateTimeRange?>(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(
//             AppRadius.r7,
//           ),
//         ),
//         backgroundColor: AppColors.white,
//         child: StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TableCalendar(
//                     daysOfWeekHeight: AppHeight.h50,
//                     daysOfWeekStyle: DaysOfWeekStyle(
//                       weekdayStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         color: AppColors.primary,
//                         fontSize: AppFontSize.s13,
//                       ),
//                       weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: AppColors.greyText,
//                         fontSize: AppFontSize.s13,
//                       ),
//                       dowTextFormatter: (date, locale) {
//                         // تعديل نص اليوم (مثلاً اختصارات بالعربية)
//                         final days = ['س', 'ن', 'ث', 'ر', 'خ', 'ج', 'س']; // الأحد - السبت بالعربية
//                         return days[date.weekday % 7];
//                       },
//                     ),
//
//                     locale: 'ar',
//                     // تدعم العربية بالكامل
//                     headerStyle: HeaderStyle(
//                       titleCentered: true,
//                       // لجعل العنوان في المنتصف
//                       titleTextStyle: TextStyle(
//                         fontSize: AppFontSize.s18,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary,
//                       ),
//                       headerMargin: EdgeInsets.symmetric(
//                         vertical: AppMarginHeight.m15,
//                         horizontal: AppMarginWidth.m10,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppColors.lightGrey,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       formatButtonVisible: false,
//                       // إخفاء زر تغيير النمط
//                       leftChevronIcon: const Icon(Icons.chevron_left, color: AppColors.primary),
//                       rightChevronIcon: const Icon(Icons.chevron_right, color: AppColors.primary),
//                       leftChevronPadding: const EdgeInsets.symmetric(horizontal: 8),
//                       rightChevronPadding: const EdgeInsets.symmetric(horizontal: 8),
//                     ),
//                     firstDay: minSelectableDate,
//                     lastDay: DateTime(minSelectableDate.year + 5, 12, 31),
//                     focusedDay: focusedDay,
//                     calendarStyle: CalendarStyle(
//                       rangeHighlightColor: AppColors.primary.withOpacity(0.2),
//
//                       /// تغيير مظهر بداية النطاق
//                       rangeStartDecoration: const BoxDecoration(
//                         color: AppColors.primary,
//                         shape: BoxShape.circle,
//                       ),
//
//                       /// تغيير مظهر نهاية النطاق
//                       rangeEndDecoration: const BoxDecoration(
//                         color: AppColors.primary,
//                         shape: BoxShape.circle,
//                       ),
//
//                       /// تغيير نص اليوم داخل النطاق (ما بين البداية والنهاية)
//                       withinRangeTextStyle: TextStyle(
//                         color: AppColors.primary,
//                         fontSize: AppFontSize.s16,
//                       ),
//
//                       /// تغيير نص اليوم في بداية النطاق
//                       rangeStartTextStyle: TextStyle(
//                         color: AppColors.white,
//                         fontSize: AppFontSize.s18,
//                         fontWeight: FontWeight.bold,
//                       ),
//
//                       /// تغيير نص اليوم في نهاية النطاق
//                       rangeEndTextStyle: TextStyle(
//                         color: AppColors.white,
//                         fontSize: AppFontSize.s18,
//                         fontWeight: FontWeight.bold,
//                       ),
//
//                       /// نص أيام نهاية الأسبوع (مثل السبت والأحد)
//                       weekendTextStyle: TextStyle(
//                         fontSize: AppFontSize.s14,
//                         color: AppColors.greyText,
//                       ),
//
//                       selectedDecoration: const BoxDecoration(
//                         color: AppColors.primary,
//                         shape: BoxShape.circle,
//                       ),
//
//                       /// نص اليوم المختار (غير ضروري إذا كنت تستخدم range فقط)
//                       selectedTextStyle: TextStyle(
//                         fontSize: AppFontSize.s20,
//                         color: AppColors.white,
//                       ),
//
//                       todayDecoration: const BoxDecoration(
//                         color: AppColors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       todayTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: AppColors.white,
//                       ),
//                     ),
//                     calendarFormat: CalendarFormat.month,
//                     rangeStartDay: rangeStart,
//                     rangeEndDay: rangeEnd,
//                     rangeSelectionMode: RangeSelectionMode.toggledOff,
//                     onDaySelected: (selectedDay, newFocusedDay) {
//                       if (selectedDay.isBefore(minSelectableDate)) {
//                         return;
//                       }
//                       setState(() {
//                         rangeStart = selectedDay;
//                         rangeEnd = null;
//                         rangeSelectionMode = RangeSelectionMode.toggledOn;
//                         focusedDay = newFocusedDay;
//                       });
//                     },
//
//                     onRangeSelected: (start, end, newFocusedDay) {
//                       if (start == null || start.isBefore(minSelectableDate)) {
//                         return;
//                       }
//                       setState(() {
//                         rangeStart = start;
//                         rangeEnd = end;
//                         rangeSelectionMode = RangeSelectionMode.toggledOn;
//                         focusedDay = newFocusedDay;
//                       });
//                     },
//                     selectedDayPredicate: (day) => rangeStart != null && isSameDay(day, rangeStart),
//                   ),
//                   SizedBox(height: AppHeight.h20),
//                   CustomElevatedButton(
//                     marginStart: AppMarginWidth.m10,
//                     marginEnd: AppMarginWidth.m10,
//                     height: AppHeight.h40,
//                     width: double.infinity,
//                     color: AppColors.primary,
//                     borderRadius: AppRadius.r7,
//                     onPressed: () {
//                       if (rangeStart == null) return;
//                       context.pop(
//                         DateTimeRange(
//                           start: rangeStart!,
//                           end: rangeEnd ?? rangeStart!,
//                         ),
//                       );
//                     },
//                     child: const BodyTitle(
//                       text: "تأكيد",
//                       color: AppColors.white,
//                     ),
//                   ),
//                   SizedBox(height: AppHeight.h11),
//                   CustomElevatedButton(
//                     marginStart: AppMarginWidth.m10,
//                     marginEnd: AppMarginWidth.m10,
//                     marginBottom: AppMarginHeight.m10,
//                     height: AppHeight.h40,
//                     elevation: 0,
//                     width: double.infinity,
//                     color: AppColors.white,
//                     borderSide: const BorderSide(color: AppColors.red),
//                     borderRadius: AppRadius.r7,
//                     onPressed: () {
//                       context.pop();
//                     },
//                     child: const BodyTitle(
//                       text: "إلفاء",
//                       color: AppColors.red,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }
