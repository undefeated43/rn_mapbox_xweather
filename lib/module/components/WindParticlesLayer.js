"use strict";

import React from 'react';
import RNMBXWindParticlesLayerNativeComponent from '../specs/RNMBXWindParticlesLayerNativeComponent';
import { jsx as _jsx } from "react/jsx-runtime";
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
class WindParticlesLayer extends React.PureComponent {
  static defaultProps = {
    visible: true,
    opacity: 1.0,
    particleDensity: 'normal',
    speedMultiplier: 1.0
  };
  render() {
    return /*#__PURE__*/_jsx(RNMBXWindParticlesLayerNativeComponent, {
      ...this.props
    });
  }
}
export default WindParticlesLayer;
//# sourceMappingURL=WindParticlesLayer.js.map