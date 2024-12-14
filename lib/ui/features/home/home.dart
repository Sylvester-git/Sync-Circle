import 'package:flutter/material.dart';
import 'package:synccircle/package_barrel.dart';

import 'package:synccircle/util/assets.dart';
import 'package:weather_animation/weather_animation.dart';

import '../../../app/constants.dart';
import '../../../app/provider.dart';
import '../../../util/functions.dart';
import '../../../util/style.dart';
import 'home_widgets/calendar_view_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: maxHeight,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned.fill(
                  child: WrapperScene.weather(scene: WeatherScene.snowfall),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.locationSvg),
                              const SizedBox(width: 10),
                              Consumer(
                                builder: (context, ref, child) {
                                  ref
                                      .read(getCurrentLocationProvider.notifier)
                                      .getAddressFromPostion();
                                  final currentLocationNotifier =
                                      ref.watch(getCurrentLocationProvider);
                                  return Text(
                                    currentLocationNotifier.isLoading
                                        ? "Loading....."
                                        : '${getWordBeforeSpace(currentLocationNotifier.currentlocation.$1 ?? "")}, ${currentLocationNotifier.currentlocation.$2}',
                                    style: getArchivo(
                                        fontSize: 24,
                                        fontweight: FontWeight.w500),
                                  );
                                },
                              )
                            ],
                          ),
                          const SizedBox(width: 20),
                          Text(
                            greeting(),
                            style: getArchivo(fontSize: 20),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            '16 c',
                            style: getArchivo(fontSize: 48),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(
                    top: maxHeight / 3,
                    left: 10,
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final calenderViewNmuber =
                          ref.watch(changeCalendarViewProvider);

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: calandarViewNumberMap.keys.map((number) {
                              return Container(
                                width: 75,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  gradient: calenderViewNmuber == number
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
                                  color: calenderViewNmuber == number
                                      ? null
                                      : Colors.white.withOpacity(.6),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    ref
                                        .read(
                                            changeCalendarViewProvider.notifier)
                                        .changeCalendarView(view: number);
                                  },
                                  child: Center(
                                    child: Text(
                                      calandarViewNumberMap[number].toString(),
                                      style: getArchivo(
                                        textcolor: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          Expanded(
                            child: calenderView(
                              context: context,
                              viewNumber: calenderViewNmuber,
                            ),
                          )
                        ],
                      );
                    },
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
