import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../package_barrel.dart';
import '../../../util/functions.dart';
import '../../../util/style.dart';

Widget monthView({required BuildContext context}) {
  return MonthView(
    controller: EventController(),
    hideDaysNotInMonth: true,
    cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) {
      return Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: isToday
              ? LinearGradient(
                  colors: [
                    Colors.white.withOpacity(.4),
                    Colors.blue.shade100,
                    Colors.blue.shade300,
                    Colors.blue.shade400,
                    Colors.blue.shade300,
                    Colors.white.withOpacity(.4),
                    Colors.blue.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Center(
          child: Text(
            '${date.day}',
            textAlign: TextAlign.center,
            style: getArchivo(
              fontSize: 14,
            ),
          ),
        ),
      );
    },
    minMonth: DateTime(1990),
    maxMonth: DateTime(2050),
    cellAspectRatio: .7,
    onPageChange: (date, pageIndex) =>
        log(pageIndex.toString(), name: "pageIndex"),
    onCellTap: (events, date) {
      // Implement callback when user taps on a cell.
      log(events.toString(), name: "onCellTap");
    },
    startDay: WeekDays.sunday,
    borderColor: Colors.white,
    borderSize: 0.5,
    initialMonth: DateTime.now(),
    // To change the first day of the week.
    // This callback will only work if cellBuilder is null.
    onEventTap: (event, date) => log(date.toString(), name: "ONEVENTTAP"),
    onEventDoubleTap: (events, date) =>
        log(date.toString(), name: "onEventDoubleTap"),
    onEventLongTap: (event, date) =>
        log(date.toString(), name: "onEventLongTap"),
    onDateLongPress: (date) => log(date.toString(), name: "onDateLongPress"),

    headerBuilder: (date) {
      return Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Text(
              formatDateToMonthYear(date),
            )),
      );
    },

    showWeekTileBorder: true, // To show or hide header border
  );
}

Widget weekView({required BuildContext context}) {
  return WeekView(
    controller: EventController(),
    minDay: DateTime(1990),
    maxDay: DateTime(2050),
    heightPerMinute: 1,
    headerStyle: HeaderStyle(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
      ),
      headerTextStyle: getArchivo(
        fontSize: 14,
        textcolor: Colors.black,
      ),
    ),
    hourIndicatorSettings: const HourIndicatorSettings(
      color: Colors.white,
      dashWidth: 6,
    ),
    timeLineBuilder: (date) {
      return Text(
        formatDateToAmPm(date),
        style: getArchivo(
          textcolor: Colors.black,
        ),
      );
    },
    timeLineOffset: 10,
    liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
      color: Colors.blue.shade200,
      showBullet: true,
    ),
    onPageChange: (date, pageIndex) =>
        log(pageIndex.toString(), name: "pageIndex"),
    showVerticalLines: false,
    backgroundColor: Colors.transparent,
    eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
      return Container();
    },
    onEventTap: (event, date) => log(date.toString(), name: "ONEVENTTAP"),
    onEventDoubleTap: (events, date) =>
        log(date.toString(), name: "onEventDoubleTap"),
    onEventLongTap: (event, date) =>
        log(date.toString(), name: "onEventLongTap"),
    onDateLongPress: (date) => log(date.toString(), name: "onDateLongPress"),
  );
}

Widget dayView({required BuildContext context}) {
  return DayView(
    controller: EventController(),
    minDay: DateTime(1990),
    maxDay: DateTime(2050),
    heightPerMinute: 1,
    headerStyle: HeaderStyle(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
      ),
      headerTextStyle: getArchivo(
        fontSize: 14,
        textcolor: Colors.black,
      ),
    ),
    hourIndicatorSettings: const HourIndicatorSettings(
      color: Colors.white,
      dashWidth: 6,
    ),
    timeLineBuilder: (date) {
      return Text(
        formatDateToAmPm(date),
        style: getArchivo(
          textcolor: Colors.black,
        ),
      );
    },
    timeLineOffset: 10,
    liveTimeIndicatorSettings: LiveTimeIndicatorSettings(
      color: Colors.blue.shade200,
      showBullet: true,
    ),
    onPageChange: (date, pageIndex) =>
        log(pageIndex.toString(), name: "pageIndex"),
    backgroundColor: Colors.transparent,
    eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
      return Container();
    },
    onEventTap: (event, date) => log(date.toString(), name: "ONEVENTTAP"),
    onEventDoubleTap: (events, date) =>
        log(date.toString(), name: "onEventDoubleTap"),
    onEventLongTap: (event, date) =>
        log(date.toString(), name: "onEventLongTap"),
    onDateLongPress: (date) => log(date.toString(), name: "onDateLongPress"),
  );
}
