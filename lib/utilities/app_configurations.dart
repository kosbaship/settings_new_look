import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_new_look/utilities/app_bloc_observer.dart';

void setupAppConfigurations() => Bloc.observer = AppBlocObserver.getInstance;
