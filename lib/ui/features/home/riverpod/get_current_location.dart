// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../package_barrel.dart';

part 'get_current_location.freezed.dart';

@freezed
class CurrenLocationClass with _$CurrenLocationClass {
  const factory CurrenLocationClass({
    required (String?, String?) currentlocation,
    required String errormessage,
    required bool isLoading,
  }) = _CurrenLocationClass;
}

class GetCurrentLocationNotifier extends StateNotifier<CurrenLocationClass> {
  GetCurrentLocationNotifier()
      : super(const CurrenLocationClass(
          currentlocation: ("", ""),
          errormessage: "",
          isLoading: true,
        ));

  Future<Position?> _determinPosition() async {
    // log(state.isLoading.toString(), name: 'ISLOADING');
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // state.errormessage = sta = 'Location services are disabled.';
      // isLoading = false;
      state = state.copyWith(
        errormessage: 'Location services are disabled.',
        isLoading: false,
      );

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        state = state.copyWith(
          errormessage: 'Location permissions are denied.',
          isLoading: false,
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      state = state.copyWith(
        errormessage:
            'Location permissions are permanently denied, we cannot request permissions.',
        isLoading: false,
      );
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromPostion() async {
    final position = await _determinPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position?.latitude ?? 6.687796,
      position?.longitude ?? 3.168466,
    );

    // log('LAT: ${position?.latitude}, LONG: ${position?.longitude}',
    //     name: 'POSITION');

    Placemark places = placemarks[0];
    // log(places.country ?? "", name: 'COUNTRY');
    // log(places.locality ?? "", name: 'LOCALITY');
    // log(places.subLocality ?? "", name: 'SUBLOCALITY');
    // log(places.administrativeArea ?? "", name: 'ADMIN-AREA');
    // log(places.name ?? "", name: 'NAME');
    // log(places.street ?? "", name: 'STREET');
    // log(places.isoCountryCode ?? "", name: 'COUNTRY CODE');
    state = state.copyWith(
      errormessage: '',
      isLoading: false,
      currentlocation: (places.administrativeArea, places.isoCountryCode),
    );
    // log(state.isLoading.toString(), name: 'ISLOADING');
  }
}
