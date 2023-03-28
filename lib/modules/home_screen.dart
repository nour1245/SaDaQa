import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_cubit.dart';
import 'package:quran/cubit/app_state.dart';
import 'package:quran/shared/components/components.dart';
import 'home screens/azkar_screen.dart';

import 'home screens/hades_screen.dart';
import 'home screens/mushaf_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var chapters = AppCubit.get(context).chapters;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        navigatTO(context, MushafScreen(chapters: chapters));
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 150,
                        width: 150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/mushaf.png')),
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 25,
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Text(
                            'المصحف',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(
                      onTap: () {
                        navigatTO(context, const AzkarScreen());
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 150,
                        width: 150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/spha.png')),
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 25,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Text(
                            'اذكــار',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        navigatTO(context, const HadisScreen());
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 150,
                        width: 150,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/hades.png')),
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 25,
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Text(
                            'احــاديث',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
