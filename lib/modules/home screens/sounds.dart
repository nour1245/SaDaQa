import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_cubit.dart';
import 'package:quran/cubit/app_state.dart';
import 'package:quran/modules/sound_player.dart';
import 'package:quran/shared/components/components.dart';

class SoundsScreen extends StatelessWidget {
  final cheakId;
  final chapters;
  const SoundsScreen({Key? key, required this.cheakId, required this.chapters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        AppCubit cubit = AppCubit();
        cubit.getRecitationSounds(cheakId); // Call getRecitationSounds here
        return cubit;
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: ListView.separated(
                itemCount: AppCubit.get(context).recitationsSounds.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      navigatTO(
                        context,
                        SoundPlayerScreen(
                          url: AppCubit.get(context)
                              .recitationsSounds[index]
                              .audioUrl,
                          soundName: chapters[index].nameArabic,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${AppCubit.get(context).recitationsSounds[index].chapterId}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
