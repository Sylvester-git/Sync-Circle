import 'package:synccircle/package_barrel.dart';

import '../ui/features/home/riverpod/change_calendar_view.dart';
import '../ui/features/home/riverpod/get_current_location.dart';

final getCurrentLocationProvider = StateNotifierProvider.autoDispose<
    GetCurrentLocationNotifier, CurrenLocationClass>(
  (ref) => GetCurrentLocationNotifier(),
);

final changeCalendarViewProvider =
    StateNotifierProvider<ChangeCalendarViewNotifier, int>(
        (ref) => ChangeCalendarViewNotifier());
