import Foundation
import MapboxMaps
import MapsGLMaps
import MapsGL

/// Protocol for XWeather layers that need controller access
protocol RNMBXWeatherLayerProtocol: AnyObject {
    func onXWeatherControllerReady(_ controller: MapboxMapController)
}

/// Base class for XWeather weather layers
@objc(RNMBXWeatherLayer)
public class RNMBXWeatherLayer: UIView, RNMBXMapAndMapViewComponent, RNMBXWeatherLayerProtocol {
    @objc public weak var bridge: RCTBridge? = nil
    @objc public var id: String!

    weak var map: RNMBXMapView? = nil
    var weatherController: MapboxMapController? = nil

    /// Layer type identifier
    @objc public var layerType: String? = nil {
        didSet { updateWeatherLayer() }
    }

    /// Visibility
    @objc public var visible: Bool = true {
        didSet { updateWeatherLayer() }
    }

    /// Opacity (0.0 - 1.0)
    @objc public var opacity: NSNumber? = nil {
        didSet { updateWeatherLayer() }
    }

    // MARK: - RNMBXMapComponent Protocol

    public func waitForStyleLoad() -> Bool {
        return false // XWeather doesn't depend on Mapbox style
    }

    public func addToMap(_ map: RNMBXMapView, style: Style) {
        fatalError("Use addToMap(_:mapView:style:) instead")
    }

    public func removeFromMap(_ map: RNMBXMapView, reason: RemovalReason) -> Bool {
        fatalError("Use removeFromMap(_:mapView:reason:) instead")
    }

    // MARK: - RNMBXMapAndMapViewComponent Protocol

    public func addToMap(_ map: RNMBXMapView, mapView: MapView, style: Style) {
        self.map = map

        if let controller = map.xweatherController {
            onXWeatherControllerReady(controller)
        }
        // Otherwise wait for xweatherDidLoad() callback
    }

    public func removeFromMap(_ map: RNMBXMapView, mapView: MapView, reason: RemovalReason) -> Bool {
        removeWeatherLayer()
        self.weatherController = nil
        self.map = nil
        return true
    }

    // MARK: - RNMBXWeatherLayerProtocol

    func onXWeatherControllerReady(_ controller: MapboxMapController) {
        self.weatherController = controller
        addWeatherLayer()
    }

    // MARK: - Subclass Override Points

    /// Subclasses override to create their specific weather layer config
    func makeWeatherLayerConfig() -> WeatherLayerConfigProvider? {
        fatalError("Subclasses must implement makeWeatherLayerConfig()")
    }

    /// Add the weather layer
    func addWeatherLayer() {
        guard let controller = weatherController,
              let config = makeWeatherLayerConfig() else {
            return
        }

        do {
            try controller.addWeatherLayer(config: config)
            Logger.log(level: .info, message: "Added XWeather layer: \(optional: id)")
        } catch {
            Logger.log(level: .error, message: "Failed to add XWeather layer: \(error)")
        }
    }

    /// Update when properties change
    func updateWeatherLayer() {
        guard weatherController != nil else { return }

        // Remove and re-add for now
        removeWeatherLayer()
        addWeatherLayer()
    }

    /// Remove the weather layer
    func removeWeatherLayer() {
        guard let controller = weatherController,
              let id = id else {
            return
        }

        controller.removeWeatherLayer(withId: id)
    }
}
