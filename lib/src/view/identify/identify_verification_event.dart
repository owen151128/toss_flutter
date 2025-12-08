part of 'identify_verification_view_model.dart';

abstract class IdentifyVerificationEvent {}

class IdentifyVerificationMoVerifyButtonClickEvent
    extends IdentifyVerificationEvent {}

class IdentifyVerificationDisposeEvent extends IdentifyVerificationEvent {}
