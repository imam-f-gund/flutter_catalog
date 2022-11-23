import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/ui/styles/style.dart';

class MovieBox extends StatelessWidget {
  // const MovieBox({super.key});

  final String urls;
  MovieBox(this.urls);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: parentStyle.clone()..background.image(url: urls, fit: BoxFit.fill),
    );
  }
}
