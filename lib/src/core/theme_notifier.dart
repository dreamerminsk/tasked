class ThemeNotifier extends ChangeNotifier {
  ColorSchemeSeed _seedData;
  ThemeNotifier(this._seedData);

  get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedData.seedColor,
          dynamicSchemeVariant: _seedData.dynamicSchemeVariant,
          contrastLevel: _seedData.contrastLevel,
        ),
      );

   void randomise() {
       _seedData = ColorSchemeSeed.random();
      notifyListeners();
   }
}