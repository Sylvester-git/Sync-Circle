import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../calendar_views.dart';

Widget calenderView({required int viewNumber, required BuildContext context}) {
  if (viewNumber == 0) {
    return monthView(context: context);
  }
  if (viewNumber == 1) {
    return weekView(context: context);
  }
  return dayView(context: context);
}
