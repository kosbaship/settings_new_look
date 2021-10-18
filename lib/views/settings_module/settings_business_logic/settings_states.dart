abstract class SettingsStates {}

class SettingsInitialState extends SettingsStates {}

class SettingsLoadingDataInProgressState extends SettingsStates {}

class SettingsErrorLoadingDataState extends SettingsStates {
  final String errorMessage;
  SettingsErrorLoadingDataState(this.errorMessage);
}

class SettingsLoadingDataSuccessState extends SettingsStates {}

class SettingsChangeTabBarIndexState extends SettingsStates {}

class SettingsChangeExaminationTypeState extends SettingsStates {}

class SettingsConfirmationScheduleTypeState extends SettingsStates {}

class SettingsChangeExpandedTilesValueState extends SettingsStates {}

class SettingsChangeExaminationDurationState extends SettingsStates {}

class SettingsEnableSecondShiftDurationState extends SettingsStates {}

class SettingsDisableSecondShiftDurationState extends SettingsStates {}

class SettingsConfirmSelectedDateState extends SettingsStates {}

class SettingsSelectDateState extends SettingsStates {}
