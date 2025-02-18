import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../constants/images.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [
      Color(0xFF2F2F2F),
      Color(0xFF3E3E3E),
      Color(0xFF474747),
      Color(0xFF515151),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(AppImages.kRickAndMorty, fit: BoxFit.cover),
              ),
              Divider(color: Colors.amber, thickness: 5, height: 0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(math.pi / 10),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
