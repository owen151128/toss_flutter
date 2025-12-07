import 'package:flutter/material.dart';

class TossButtons {
  const TossButtons._();

  static Widget createButton(
    BuildContext context,
    String text,
    void Function()? onPressed,
  ) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(padding: const EdgeInsets.all(18), child: Text(text)),
        ),
      ),
    );
  }
}
