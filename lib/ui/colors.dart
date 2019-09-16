import 'package:flutter/material.dart';

const primaryColor = const Color(0xFF1D4EC7);
const primaryLight = const Color(0xFF6F8AC4);
const primaryDeepLight = const Color(0xFFAAB7CE);
const primaryDark = const Color(0xFF031A98);

const secondaryColor = const Color(0xFFA2A1A8);
const secondaryLight = const Color(0xFFBBC4D5);
const secondaryDeepLight = const Color(0xFFE6EAF0);
const secondaryDark = const Color(0xFF3A4053);

const secondaryWhite = const Color(0xFFFFFFFF);

const Color gradientStart = const Color(0xFF1D4EC7);
const Color gradientEnd = const Color(0xFF031A98);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFFFD60A3), Color(0xFFFF8961)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
