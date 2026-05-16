import 'package:flutter/material.dart';

/// ===============================
/// 🎨 APP COLOR PALETTE
/// Based on Login Screen UI
/// ===============================

/// 🔵 Brand Colors
Color primary = const Color(0xFF001B3A); // Main dark navy
Color darkPrimary = const Color(0xFF00122A);
Color lightPrimary = const Color(0xFF2A6FD6);
Color secondary = const Color(0xFF006D77); // teal accent
Color accentBlue = const Color(0xFF3D8BFF);

/// ⚪ Background Colors
Color backgroundColor = const Color(0xFFEDEDED); // app bg
Color cardColor = const Color(0xFFF7F7F7); // container bg
Color white = Colors.white;

/// ⚫ Text Colors
Color textPrimary = const Color(0xFF111111);
Color textSecondary = Colors.black54;
Color textLight = Colors.black45;

/// ⚙️ Border & Divider Colors
Color borderColor = const Color(0xFFD6D6D6);
Color dividerColor = const Color(0xFFE0E0E0);

/// 🌑 Neutral Colors
Color black = Colors.black;
Color grey = const Color(0xFF8E8E8E);
Color lightGrey = const Color(0xFFF1F1F1);

/// ===============================
/// 🌈 GRADIENTS
/// ===============================

/// 🔵 Primary App Gradient
LinearGradient primaryGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF001B3A),
    Color(0xFF2A6FD6),
  ],
);

/// 🌊 Soft Background Gradient
LinearGradient softGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFF7F7F7),
    Color(0xFFEDEDED),
  ],
);

/// 🔘 Button Gradient
LinearGradient buttonGradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF001B3A),
    Color(0xFF2A6FD6),
  ],
);

/// ===============================
/// 🎯 UI SPECIFIC COLORS
/// ===============================

Color buttonColor = primary;
Color buttonTextColor = white;

Color inputFillColor = white;
Color inputBorderColor = borderColor;
Color focusedBorderColor = primary;

Color selectedRoleColor = primary;
Color unselectedRoleColor = const Color(0xFFE5E5E5);

Color successColor = const Color(0xFF1E8E3E);
Color errorColor = const Color(0xFFD93025);
Color warningColor = const Color(0xFFF9AB00);