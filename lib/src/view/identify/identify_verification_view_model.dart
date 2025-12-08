import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';

part 'identify_verification_event.dart';
part 'identify_verification_state.dart';

class IdentifyVerificationViewModel
    extends
        BaseViewModel<IdentifyVerificationEvent, IdentifyVerificationState> {
  IdentifyVerificationViewModel() : super(IdentifyVerificationInitialState()) {
    on<IdentifyVerificationMoVerifyButtonClickEvent>(
      onIdentifyVerificationMoVerifyButtonClickEvent,
    );
    on<IdentifyVerificationDisposeEvent>(onIdentifyVerificationDisposeEvent);
  }

  Future<void> onIdentifyVerificationMoVerifyButtonClickEvent(
    IdentifyVerificationMoVerifyButtonClickEvent event,
    Emitter<IdentifyVerificationState> emit,
  ) async {}

  Future<void> onIdentifyVerificationDisposeEvent(
    IdentifyVerificationDisposeEvent event,
    Emitter<IdentifyVerificationState> emit,
  ) async {}
}
