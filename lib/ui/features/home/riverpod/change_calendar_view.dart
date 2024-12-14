import 'dart:developer';

import 'package:synccircle/package_barrel.dart';

class ChangeCalendarViewNotifier extends StateNotifier<int> {
  ChangeCalendarViewNotifier() : super(0);

  void changeCalendarView({required int view}) {
    log(state.toString(), name: 'CURRENT VIEW');
    state = view;
    log(state.toString(), name: 'UPDATED VIEW');
  }
}
