import 'package:flutter/material.dart';

/// ===============================
/// 🎨 BRAND COLORS
/// ===============================

Color primary = const Color(0xFF1398DF);
Color lightPrimary = const Color(0xFF1398E1);
Color darkPrimary = const Color(0xFF0D539A);

Color secondary = const Color(0xFF4FC3F7);
Color accent = const Color(0xFF82D9FF);

/// ===============================
/// ⚪ BACKGROUND COLORS
/// ===============================

Color backgroundColor = const Color(0xFFF7FAFD);
Color scaffoldBackground = Colors.white;
Color cardColor = Colors.white;
Color white = Colors.white;

/// ===============================
/// 📝 TEXT COLORS
/// ===============================

Color textPrimary = const Color(0xFF1A1A1A);
Color textSecondary = const Color(0xFF666666);
Color textLight = const Color(0xFF999999);

/// ===============================
/// 🔲 BORDER COLORS
/// ===============================

Color borderColor = const Color(0xFFE2E8F0);
Color dividerColor = const Color(0xFFF1F5F9);

/// ===============================
/// ⚫ NEUTRAL COLORS
/// ===============================

Color black = Colors.black;
Color grey = const Color(0xFF8E8E8E);
Color lightGrey = const Color(0xFFF5F5F5);

/// ===============================
/// 🌈 GRADIENTS
/// ===============================

LinearGradient primaryGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF1398DF),
    Color(0xFF0D539A),
  ],
);

LinearGradient buttonGradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF1398E1),
    Color(0xFF0D539A),
  ],
);

LinearGradient softGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFFFFFF),
    Color(0xFFF7FAFD),
  ],
);

/// ===============================
/// 🎯 UI COLORS
/// ===============================

Color buttonColor = primary;
Color buttonTextColor = white;

Color inputFillColor = Colors.white;
Color inputBorderColor = borderColor;
Color focusedBorderColor = primary;

Color selectedColor = primary;
Color unselectedColor = const Color(0xFFF1F5F9);

/// Status Colors
Color successColor = const Color(0xFF16A34A);
Color errorColor = const Color(0xFFDC2626);
Color warningColor = const Color(0xFFF59E0B);