# XWeather Integration

@rnmapbox/maps supports XWeather's MapsGL SDK for displaying animated weather layers on iOS.

## Prerequisites

- Active XWeather Weather API subscription
- XWeather client ID and secret
- iOS platform (Android support coming soon)

## Installation

The XWeather SDK is automatically included as a dependency. Simply run:

```bash
cd ios && pod install
```

## Basic Usage

### 1. Configure MapView with Credentials

```tsx
import MapView, { WindParticlesLayer } from '@rnmapbox/maps';

<MapView
  xweatherClientId="YOUR_CLIENT_ID"
  xweatherClientSecret="YOUR_CLIENT_SECRET"
>
  {/* Weather layers go here */}
</MapView>
```

### 2. Add WindParticlesLayer

```tsx
<MapView
  xweatherClientId="YOUR_CLIENT_ID"
  xweatherClientSecret="YOUR_CLIENT_SECRET"
>
  <WindParticlesLayer
    id="wind"
    visible={true}
    particleDensity="extreme"
    opacity={0.8}
  />
</MapView>
```

## WindParticlesLayer Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | **required** | Unique layer identifier |
| `visible` | `boolean` | `true` | Layer visibility |
| `opacity` | `number` | `1.0` | Layer opacity (0.0 - 1.0) |
| `particleDensity` | `'light' \| 'normal' \| 'extreme'` | `'normal'` | Particle density |
| `speedMultiplier` | `number` | `1.0` | Animation speed multiplier |

## Complete Example

```tsx
import React, { useState } from 'react';
import { Button, View } from 'react-native';
import MapView, { Camera, WindParticlesLayer } from '@rnmapbox/maps';

export default function WeatherMap() {
  const [showWind, setShowWind] = useState(true);

  return (
    <View style={{ flex: 1 }}>
      <MapView
        style={{ flex: 1 }}
        styleURL="mapbox://styles/mapbox/dark-v11"
        xweatherClientId={process.env.XWEATHER_CLIENT_ID}
        xweatherClientSecret={process.env.XWEATHER_CLIENT_SECRET}
      >
        <Camera
          zoomLevel={4}
          centerCoordinate={[-98.5795, 39.8283]}
        />

        {showWind && (
          <WindParticlesLayer
            id="wind-particles"
            particleDensity="extreme"
            opacity={0.8}
          />
        )}
      </MapView>

      <Button
        title={showWind ? 'Hide Wind' : 'Show Wind'}
        onPress={() => setShowWind(!showWind)}
      />
    </View>
  );
}
```

## Security Note

XWeather credentials should not be hardcoded in your app. Use environment variables or a backend proxy for production apps.

## Platform Support

- ✅ iOS 13+
- ⏳ Android (planned for future release)

## Troubleshooting

### "XWeather controller not initialized"

This warning means the MapView hasn't received valid credentials. Ensure:
1. `xweatherClientId` and `xweatherClientSecret` are both set
2. Credentials are valid
3. MapView has finished mounting

### Layer not appearing

1. Verify credentials are correct
2. Check that you're using a dark style (weather layers show better on dark backgrounds)
3. Ensure layer `visible` prop is `true`
4. Try increasing `opacity` to `1.0`

## Additional Resources

- [XWeather Documentation](https://www.xweather.com/docs/)
- [MapsGL iOS SDK](https://www.xweather.com/docs/mapsgl-apple-sdk/)
