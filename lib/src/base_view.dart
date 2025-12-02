import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({super.key, required this.viewModel, required this.builder});

  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Builder(
        builder: (context) {
          final viewModel = context.watch<T>();
          return viewModel.state.isLoading
              ? Center(
                  child: Transform.scale(
                    scale: 1.5,
                    child: CircularProgressIndicator(),
                  ),
                )
              : builder(context, viewModel);
        },
      ),
    );
  }
}
