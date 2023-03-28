import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/cubit/app_state.dart';
import 'package:quran/models/recitations_model.dart';
import 'package:quran/modules/quran_sounds_screen.dart';
import 'package:quran/shared/network/remote/diohelper.dart';

import '../models/recitaion_sounds_model.dart';
import '../models/surahmodel.dart';
import '../modules/home_screen.dart';
import '../modules/tsbeh_screen.dart';
import '../shared/components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const TsbehScreen(),
    const QuranScreen(),
  ];

  List<String> titles = [
    'الصفحة الرئيسية',
    'السبحة',
    'صوتيات',
  ];
  void changeNavBar(index) {
    currentIndex = index;
    emit(BottomNavBarChange());
  }

  SphaIncrease() {
    text = text + 1;
    emit(SphaNumberChanged());
  }

  SphaRest() {
    text = 0;
    emit(SphaNumberChanged());
  }

  SurahInfo? model;
  List chapters = [];
  getMushaf() {
    emit(MushafLoading());
    DioHelper.getData(url: 'v4/chapters').then((value) {
      model = SurahInfo.fromJson(value.data);
      chapters = model!.chapters;

      emit(MushafLoadingSucsses());
    }).catchError((error) {
      emit(MushafLoadingError());
    });
  }

  Recitation? recitaionModel;
  List recitations = [];
  getRecitation() {
    emit(RecitationsLoading());
    DioHelper.getData(
        url: 'v4/resources/recitations',
        query: {'language': 'ar'}).then((value) {
      recitaionModel = Recitation.fromJson(value.data);
      recitations = recitaionModel!.recitations!;
    }).catchError((error) {
      emit(RecitationsLoadingError());
    });
  }

  RecitaionSounds? recitaionSoundsModel;
  List recitationsSounds = [];
  getRecitationSounds(CheakId) {
    emit(RecitationsSoundsLoading());
    DioHelper.getData(
        url: 'v4/chapter_recitations/$CheakId',
        query: {'language': 'ar'}).then((value) {
      recitaionSoundsModel = RecitaionSounds.fromJson(value.data);
      recitationsSounds = recitaionSoundsModel!.audioFiles!;
      emit(RecitationsSoundsLoadingSucsses());
    }).catchError((error) {
      emit(RecitationsSoundsLoadingError());
    });
  }
}
