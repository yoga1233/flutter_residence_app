import 'package:flutter/material.dart';

extension NumExt on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());
}
