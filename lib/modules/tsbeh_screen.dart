import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_cubit.dart';
import 'package:quran/cubit/app_state.dart';
import 'package:quran/shared/network/local/cash_helper.dart';

import '../shared/components/constants.dart';

class TsbehScreen extends StatelessWidget {
  const TsbehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        AppCubit.get(context).SphaIncrease();
                        CacheHelper.saveData(key: 'text', value: text);
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.green[600],
                        child: Center(
                          child: Text(
                            '$text',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 10),
                  IconButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      AppCubit.get(context).SphaRest();
                      CacheHelper.saveData(key: 'text', value: text);
                    },
                    icon: const Icon(Icons.delete),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
