import 'package:flutter/material.dart';
import 'package:quran/modules/morning_azkar.dart';
import 'package:quran/modules/night_azkar.dart';
import 'package:quran/shared/components/components.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اذكار'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      navigatTO(context, MorningAzkarScreen());
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/169367.png')),
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
                          'اذكـار الصباح',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      navigatTO(context, NightAzkarScreen());
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/moon-icon-png-3.jpg')),
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
                          'اذكــار المسـاء',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
