import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/views/settings_page/settings_cubit/settings_states.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  int tabBarIndex = 0;
  changeIndex(index) {
    tabBarIndex = index;
    emit(SettingsChangeTabBarIndexState());
  }
}
