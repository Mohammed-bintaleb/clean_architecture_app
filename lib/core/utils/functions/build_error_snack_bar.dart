import 'package:flutter/material.dart';

SnackBar buildErrorWidget(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
    ),
  );
}
