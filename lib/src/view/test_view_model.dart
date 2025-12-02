import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toss_flutter/src/base_view_model.dart';

part 'test_view_event.dart';

class TestViewModel extends BaseViewModel<TestEvent, BaseViewState> {
  TestViewModel() : super(BaseViewState(isLoading: true)) {
    on<TestViewInitialize>(onInitializeEvent);
    add(TestViewInitialize());
  }

  Future<void> onInitializeEvent(
    TestViewInitialize event,
    Emitter<BaseViewState> emit,
  ) async {
    emit(BaseViewState(isLoading: true));
    await Future.delayed(Duration(seconds: 3));
    emit(BaseViewState(isLoading: false));
  }
}
