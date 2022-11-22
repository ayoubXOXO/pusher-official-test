import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
}

hideLoading(BuildContext context) => Navigator.pop(context);
