import React, { useState } from 'react';
import { Button, StyleSheet, View } from 'react-native';
import MapView, { Camera, WindParticlesLayer } from '@rnmapbox/maps';

// Replace with your actual XWeather credentials
const XWEATHER_CLIENT_ID = 'YOUR_CLIENT_ID';
const XWEATHER_CLIENT_SECRET = 'YOUR_CLIENT_SECRET';

export default function WindParticlesExample() {
  const [showWind, setShowWind] = useState(true);
  const [density, setDensity] = useState<'light' | 'normal' | 'extreme'>('normal');

  return (
    <View style={styles.container}>
      <MapView
        style={styles.map}
        styleURL="mapbox://styles/mapbox/dark-v11"
        xweatherClientId={XWEATHER_CLIENT_ID}
        xweatherClientSecret={XWEATHER_CLIENT_SECRET}
      >
        <Camera
          zoomLevel={4}
          centerCoordinate={[-98.5795, 39.8283]}
        />

        {showWind && (
          <WindParticlesLayer
            id="wind-particles"
            particleDensity={density}
            opacity={0.8}
          />
        )}
      </MapView>

      <View style={styles.controls}>
        <Button
          title={showWind ? 'Hide Wind' : 'Show Wind'}
          onPress={() => setShowWind(!showWind)}
        />
        <Button
          title={`Density: ${density}`}
          onPress={() => {
            const densities = ['light', 'normal', 'extreme'] as const;
            const currentIndex = densities.indexOf(density);
            const nextIndex = (currentIndex + 1) % densities.length;
            setDensity(densities[nextIndex]);
          }}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1 },
  map: { flex: 1 },
  controls: {
    position: 'absolute',
    bottom: 20,
    left: 20,
    right: 20,
    flexDirection: 'row',
    justifyContent: 'space-around',
  },
});
