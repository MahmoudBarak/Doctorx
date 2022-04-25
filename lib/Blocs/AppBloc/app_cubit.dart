import 'package:bloc/bloc.dart';
import 'package:doctorx/model/OuestionModel.dart';
import 'package:doctorx/network/dio_helper.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode() {
    isDark = !isDark;

    emit(AppModeState());
  }


}
