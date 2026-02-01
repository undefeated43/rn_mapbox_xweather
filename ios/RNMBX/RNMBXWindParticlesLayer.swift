import Foundation
import MapsGLMaps
import MapsGLMapbox

@objc(RNMBXWindParticlesLayer)
public class RNMBXWindParticlesLayer: RNMBXWeatherLayer {

    /// Particle density: "light", "normal", "extreme"
    @objc public var particleDensity: String? = nil {
        didSet { updateWeatherLayer() }
    }

    /// Speed multiplier
    @objc public var speedMultiplier: NSNumber? = nil {
        didSet { updateWeatherLayer() }
    }

    override func makeWeatherLayerConfig() -> WeatherLayerConfigProvider? {
        guard let controller = weatherController else { return nil }

        var config = WeatherService.WindParticles(service: controller.service)

        // Apply particle density
        if let densityStr = particleDensity {
            switch densityStr.lowercased() {
            case "light":
                config.layer.paint.particle.density = .light
            case "extreme":
                config.layer.paint.particle.density = .extreme
            default:
                config.layer.paint.particle.density = .normal
            }
        }

        // Apply speed multiplier
        if let speed = speedMultiplier {
            config.layer.paint.particle.speed = speed.doubleValue
        }

        // Apply opacity
        if let opacity = opacity {
            config.layer.paint.opacity = opacity.doubleValue
        }

        return config
    }
}
