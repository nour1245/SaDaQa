import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_cubit.dart';
import 'package:quran/cubit/app_state.dart';
import 'package:quran/modules/home%20screens/sounds.dart';
import 'package:quran/shared/components/components.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppCubit.get(context).recitations.isEmpty
            ? const Center(
                child: Text(
                'تأكد من الاتصال بالانترنت ثم اعد تشغيل التطبيق',
                style: TextStyle(fontSize: 12),
              ))
            : ListView.separated(
                itemCount: AppCubit.get(context).recitations.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return bulidListItem(context, index);
                },
              );
      },
    );
  }

  Widget bulidListItem(context, index) => InkWell(
        onTap: () {
          navigatTO(
            context,
            SoundsScreen(
              cheakId: AppCubit.get(context).recitations[index].id,
              chapters: AppCubit.get(context).chapters,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${AppCubit.get(context).recitations[index].translatedName.name}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              AppCubit.get(context).recitations[index].style != null
                  ? AppCubit.get(context).recitations[index].style != 'Mujawwad'
                      ? const Text('مرتل')
                      : const Text('مجود')
                  : const Text(''),
            ],
          ),
        ),
      );
}
