import 'package:flutter_bloc/flutter_bloc.dart';

class BaseViewModel<E, S> extends Bloc<E, S> {
  BaseViewModel(super.initialState);
}
