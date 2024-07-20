import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF4169E1), // Azul Royal
      surfaceTint: Color(0xFF4169E1),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFBBDEFB),
      onPrimaryContainer: Color(0xFF002171),
      secondary: Color(0xFF03DAC6),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF018786),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFF018786),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF03DAC6),
      onTertiaryContainer: Color(0xFF000000),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFCF6679),
      onErrorContainer: Color(0xFF3700B3),
      surface: Colors.white,
      onSurface: Color(0xFF000000),
      onSurfaceVariant: Color(0xFF4169E1),
      outline: Color(0xFF000000),
      outlineVariant: Color(0xFF000000),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF121212),
      inversePrimary: Color(0xFFBBDEFB),
      primaryFixed: Color(0xFFBBDEFB),
      onPrimaryFixed: Color(0xFF002171),
      primaryFixedDim: Color(0xFF4169E1),
      onPrimaryFixedVariant: Color(0xFF002171),
      secondaryFixed: Color(0xFF03DAC6),
      onSecondaryFixed: Color(0xFF018786),
      secondaryFixedDim: Color(0xFF03DAC6),
      onSecondaryFixedVariant: Color(0xFF018786),
      tertiaryFixed: Color(0xFF03DAC6),
      onTertiaryFixed: Color(0xFF018786),
      tertiaryFixedDim: Color(0xFF03DAC6),
      onTertiaryFixedVariant: Color(0xFF018786),
      surfaceDim: Color(0xFF121212),
      surfaceBright: Colors.white,
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: Color(0xFFE1E1E1),
      surfaceContainer: Color(0xFFCFCFCF),
      surfaceContainerHigh: Color(0xFFB0B0B0),
      surfaceContainerHighest: Color(0xFF909090),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFBBDEFB),
      surfaceTint: Color(0xFFBBDEFB),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF002171),
      onPrimaryContainer: Color(0xFFBBDEFB),
      secondary: Color(0xFF03DAC6),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF03DAC6),
      onSecondaryContainer: Color(0xFF018786),
      tertiary: Color(0xFF03DAC6),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF018786),
      onTertiaryContainer: Color(0xFF03DAC6),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFFB00020),
      onErrorContainer: Color(0xFFCF6679),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFFFFFFF),
      onSurfaceVariant: Color(0xFFBBDEFB),
      outline: Color(0xFFFFFFFF),
      outlineVariant: Color(0xFFFFFFFF),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFFFFFFF),
      inversePrimary: Color(0xFF4169E1),
      primaryFixed: Color(0xFF4169E1),
      onPrimaryFixed: Color(0xFFBBDEFB),
      primaryFixedDim: Color(0xFF002171),
      onPrimaryFixedVariant: Color(0xFFBBDEFB),
      secondaryFixed: Color(0xFF03DAC6),
      onSecondaryFixed: Color(0xFF018786),
      secondaryFixedDim: Color(0xFF03DAC6),
      onSecondaryFixedVariant: Color(0xFF018786),
      tertiaryFixed: Color(0xFF03DAC6),
      onTertiaryFixed: Color(0xFF018786),
      tertiaryFixedDim: Color(0xFF03DAC6),
      onTertiaryFixedVariant: Color(0xFF018786),
      surfaceDim: Color(0xFF121212),
      surfaceBright: Color(0xFF121212),
      surfaceContainerLowest: Color(0xFF121212),
      surfaceContainerLow: Color(0xFF1E1E1E),
      surfaceContainer: Color(0xFF2C2C2C),
      surfaceContainerHigh: Color(0xFF3B3B3B),
      surfaceContainerHighest: Color(0xFF4A4A4A),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [
    ExtendedColor(
      seed: Color(0xFF4169E1),
      value: Color(0xFF4169E1),
      light: ColorFamily(
        color: Color(0xFF4169E1),
        onColor: Colors.white,
        colorContainer: Color(0xFFBBDEFB),
        onColorContainer: Color(0xFF002171),
      ),
      lightHighContrast: ColorFamily(
        color: Color(0xFF002171),
        onColor: Colors.white,
        colorContainer: Color(0xFF4169E1),
        onColorContainer: Color(0xFF002171),
      ),
      lightMediumContrast: ColorFamily(
        color: Color(0xFF4169E1),
        onColor: Colors.white,
        colorContainer: Color(0xFFBBDEFB),
        onColorContainer: Color(0xFF002171),
      ),
      dark: ColorFamily(
        color: Color(0xFFBBDEFB),
        onColor: Color(0xFF000000),
        colorContainer: Color(0xFF002171),
        onColorContainer: Color(0xFFBBDEFB),
      ),
      darkHighContrast: ColorFamily(
        color: Color(0xFF4169E1),
        onColor: Color(0xFFBBDEFB),
        colorContainer: Color(0xFF002171),
        onColorContainer: Color(0xFFBBDEFB),
      ),
      darkMediumContrast: ColorFamily(
        color: Color(0xFFBBDEFB),
        onColor: Color(0xFF000000),
        colorContainer: Color(0xFF002171),
        onColorContainer: Color(0xFFBBDEFB),
      ),
    ),
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
