import 'package:freezed_annotation/freezed_annotation.dart';

part 'term_agree_state.freezed.dart';

@freezed
class TermAgreeState with _$TermAgreeState {
  const factory TermAgreeState({
    @Default(false) bool checkUsage,
    @Default(false) bool checkPrivacy,
    @Default(false) bool checkLocation,
    @Default(false) bool checkMarketing,
  }) = _TermAgreeState;
}

extension TermX on TermAgreeState {
  bool isAllAgree() {
    return checkUsage && checkPrivacy && checkLocation && checkMarketing;
  }

  bool isRequiredAgree() {
    return checkUsage && checkPrivacy && checkLocation;
  }

  TermAgreeState checkAllAgree() {
    if (isAllAgree()) return const TermAgreeState();

    return const TermAgreeState(
      checkUsage: true,
      checkPrivacy: true,
      checkLocation: true,
      checkMarketing: true,
    );
  }
}
