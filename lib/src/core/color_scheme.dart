import 'properties.dart';


class NamedColorScheme {
const NamedColorScheme({required this.colorScheme});

final ColorScheme colorScheme;


factory NamedColorScheme.of(BuildContext context) {
final colorScheme = Theme.of(context).colorScheme;
return NamedColorScheme(colorScheme: colorScheme);
}

ColorProperty get primary => ColorProperty('primary', colorScheme.primary);
ColorProperty get onPrimary => ColorProperty('onPrimary', colorScheme.onPrimary);

ColorProperty get primaryContainer => ColorProperty('primaryContainer', colorScheme.primaryContainer);
ColorProperty get onPrimaryContainer => ColorProperty('onPrimaryContainer', colorScheme.onPrimaryContainer);

ColorProperty get primaryFixed => ColorProperty('primaryFixed', colorScheme.primaryFixed);
ColorProperty get primaryFixedDim => ColorProperty('primaryFixedDim', colorScheme.primaryFixedDim);
ColorProperty get onPrimaryFixed => ColorProperty('onPrimaryFixed', colorScheme.onPrimaryFixed);
ColorProperty get onPrimaryFixedVariant => ColorProperty('onPrimaryFixedVariant', colorScheme.onPrimaryFixedVariant);

ColorProperty get secondary => ColorProperty('secondary', colorScheme.secondary);
ColorProperty get onSecondary => ColorProperty('onSecondary', colorScheme.onSecondary);

ColorProperty get secondaryContainer => ColorProperty('secondaryContainer', colorScheme.secondaryContainer);
ColorProperty get onSecondaryContainer => ColorProperty('onSecondaryContainer', colorScheme.onSecondaryContainer);

ColorProperty get secondaryFixed => ColorProperty('secondaryFixed', colorScheme.secondaryFixed);
ColorProperty get secondaryFixedDim => ColorProperty('secondaryFixedDim', colorScheme.secondaryFixedDim);
ColorProperty get onSecondaryFixed => ColorProperty('onSecondaryFixed', colorScheme.onSecondaryFixed);
ColorProperty get onSecondaryFixedVariant => ColorProperty('onSecondaryFixedVariant', colorScheme.onSecondaryFixedVariant);

ColorProperty get tertiary => ColorProperty('tertiary', colorScheme.tertiary);
ColorProperty get onTertiary => ColorProperty('onTertiary', colorScheme.onTertiary);

ColorProperty get tertiaryContainer => ColorProperty('tertiaryContainer', colorScheme.tertiaryContainer);
ColorProperty get onTertiaryContainer => ColorProperty('onTertiaryContainer', colorScheme.onTertiaryContainer);

ColorProperty get tertiaryFixed => ColorProperty('tertiaryFixed', colorScheme.tertiaryFixed);
ColorProperty get tertiaryFixedDim => ColorProperty('tertiaryFixedDim', colorScheme.tertiaryFixedDim);
ColorProperty get onTertiaryFixed => ColorProperty('onTertiaryFixed', colorScheme.onTertiaryFixed);
ColorProperty get onTertiaryFixedVariant => ColorProperty('onTertiaryFixedVariant', colorScheme.onTertiaryFixedVariant);

ColorProperty get error => ColorProperty('error', colorScheme.error);
ColorProperty get onError => ColorProperty('onError', colorScheme.onError);

ColorProperty get errorContainer => ColorProperty('errorContainer', colorScheme.errorContainer);
ColorProperty get onErrorContainer => ColorProperty('onErrorContainer', colorScheme.onErrorContainer);

List<ColorProperty> get  values => <ColorProperty>[
primary,
onPrimary,
primaryContainer,
onPrimaryContainer,
primaryFixed,
primaryFixedDim,
onPrimaryFixed,
onPrimaryFixedVariant,
secondary,
onSecondary,
secondaryContainer,
onSecondaryContainer,
secondaryFixed,
secondaryFixedDim,
onSecondaryFixed,
onSecondaryFixedVariant,
tertiary,
onTertiary,
tertiaryContainer,
onTertiaryContainer,
tertiaryFixed,
tertiaryFixedDim,
onTertiaryFixed,
onTertiaryFixedVariant,
error,
onError,
errorContainer,
onErrorContainer,
];



   
  
     
   
 
   

   
    



   
 
 
    
 
 
  
      outline: outline ?? Color(MaterialDynamicColors.outline.getArgb(scheme)),
      outlineVariant: outlineVariant ?? Color(MaterialDynamicColors.outlineVariant.getArgb(scheme)),
      surface: surface ?? Color(MaterialDynamicColors.surface.getArgb(scheme)),
      surfaceDim: surfaceDim ?? Color(MaterialDynamicColors.surfaceDim.getArgb(scheme)),
      surfaceBright: surfaceBright ?? Color(MaterialDynamicColors.surfaceBright.getArgb(scheme)),
      surfaceContainerLowest: surfaceContainerLowest ?? Color(MaterialDynamicColors.surfaceContainerLowest.getArgb(scheme)),
      surfaceContainerLow: surfaceContainerLow ?? Color(MaterialDynamicColors.surfaceContainerLow.getArgb(scheme)),
      surfaceContainer: surfaceContainer ?? Color(MaterialDynamicColors.surfaceContainer.getArgb(scheme)),
      surfaceContainerHigh: surfaceContainerHigh ?? Color(MaterialDynamicColors.surfaceContainerHigh.getArgb(scheme)),
      surfaceContainerHighest: surfaceContainerHighest ?? Color(MaterialDynamicColors.surfaceContainerHighest.getArgb(scheme)),
      onSurface: onSurface ?? Color(MaterialDynamicColors.onSurface.getArgb(scheme)),
      onSurfaceVariant: onSurfaceVariant ?? Color(MaterialDynamicColors.onSurfaceVariant.getArgb(scheme)),
      inverseSurface: inverseSurface ?? Color(MaterialDynamicColors.inverseSurface.getArgb(scheme)),
      onInverseSurface: onInverseSurface ?? Color(MaterialDynamicColors.inverseOnSurface.getArgb(scheme)),
      inversePrimary: inversePrimary ?? Color(MaterialDynamicColors.inversePrimary.getArgb(scheme)),
      shadow: shadow ?? Color(MaterialDynamicColors.shadow.getArgb(scheme)),
      scrim: scrim ?? Color(MaterialDynamicColors.scrim.getArgb(scheme)),
      surfaceTint: surfaceTint ?? Color(MaterialDynamicColors.primary.getArgb(scheme)),
      brightness: brightness,
      // DEPRECATED (newest deprecations at the bottom)
      background: background ?? Color(MaterialDynamicColors.background.getArgb(scheme)),
      onBackground: onBackground ?? Color(MaterialDynamicColors.onBackground.getArgb(scheme)),
      surfaceVariant: surfaceVariant ?? Color(MaterialDynamicColors.surfaceVariant.getArgb(scheme)),
    );
  }