import React from 'react';
import RNMBXWindParticlesLayerNativeComponent from '../specs/RNMBXWindParticlesLayerNativeComponent';
import type { BaseProps } from '../types/BaseProps';

export type ParticleDensity = 'light' | 'normal' | 'extreme';

type Props = BaseProps & {
  /**
   * Unique identifier for this weather layer
   */
  id: string;

  /**
   * Visibility of the wind particles layer
   * @default true
   */
  visible?: boolean;

  /**
   * Opacity of the layer (0.0 - 1.0)
   * @default 1.0
   */
  opacity?: number;

  /**
   * Density of wind particles
   * @default 'normal'
   */
  particleDensity?: ParticleDensity;

  /**
   * Speed multiplier for particle animation
   * @default 1.0
   */
  speedMultiplier?: number;
};

/**
 * WindParticlesLayer displays animated wind particles using XWeather data.
 *
 * Requires MapView to have xweatherClientId and xweatherClientSecret props set.
 *
 * @example
 * ```tsx
 * <MapView
 *   xweatherClientId="YOUR_CLIENT_ID"
 *   xweatherClientSecret="YOUR_CLIENT_SECRET"
 * >
 *   <WindParticlesLayer
 *     id="wind-particles"
 *     visible={true}
 *     particleDensity="extreme"
 *   />
 * </MapView>
 * ```
 */
class WindParticlesLayer extends React.PureComponent<Props> {
  static defaultProps = {
    visible: true,
    opacity: 1.0,
    particleDensity: 'normal' as ParticleDensity,
    speedMultiplier: 1.0,
  };

  render() {
    return (
      <RNMBXWindParticlesLayerNativeComponent {...this.props} />
    );
  }
}

export default WindParticlesLayer;
