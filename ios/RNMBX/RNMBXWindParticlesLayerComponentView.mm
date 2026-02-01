#import "RNMBXWindParticlesLayerComponentView.h"
#import "RNMBXFabricHelpers.h"

#import <React/RCTConversions.h>
#import <React/RCTFabricComponentsPlugins.h>

#import <react/renderer/components/rnmapbox_maps_specs/ComponentDescriptors.h>
#import <react/renderer/components/rnmapbox_maps_specs/EventEmitters.h>
#import <react/renderer/components/rnmapbox_maps_specs/Props.h>
#import <react/renderer/components/rnmapbox_maps_specs/RCTComponentViewHelpers.h>

#import "RNMBXFabricPropConvert.h"
#import "rnmapbox_maps-Swift.pre.h"

using namespace facebook::react;

@interface RNMBXWindParticlesLayerComponentView () <RCTRNMBXWindParticlesLayerViewProtocol>
@end

@implementation RNMBXWindParticlesLayerComponentView {
    RNMBXWindParticlesLayer *_view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        static const auto defaultProps = std::make_shared<const RNMBXWindParticlesLayerProps>();
        _props = defaultProps;
        [self prepareView];
    }
    return self;
}

- (void)prepareView {
    _view = [[RNMBXWindParticlesLayer alloc] init];
    _view.bridge = [RCTBridge currentBridge];
    self.contentView = _view;
}

- (void)updateProps:(const Props::Shared &)props oldProps:(const Props::Shared &)oldProps {
    const auto &oldViewProps = *std::static_pointer_cast<const RNMBXWindParticlesLayerProps>(_props);
    const auto &newViewProps = *std::static_pointer_cast<const RNMBXWindParticlesLayerProps>(props);

    RNMBX_OPTIONAL_PROP_STRING(newViewProps, id, _view);
    RNMBX_OPTIONAL_PROP_BOOL(newViewProps, visible, _view);
    RNMBX_OPTIONAL_PROP_DOUBLE(newViewProps, opacity, _view);
    RNMBX_OPTIONAL_PROP_STRING(newViewProps, particleDensity, _view);
    RNMBX_OPTIONAL_PROP_DOUBLE(newViewProps, speedMultiplier, _view);

    [super updateProps:props oldProps:oldProps];
}

+ (ComponentDescriptorProvider)componentDescriptorProvider {
    return concreteComponentDescriptorProvider<RNMBXWindParticlesLayerComponentDescriptor>();
}

Class<RCTComponentViewProtocol> RNMBXWindParticlesLayerCls(void) {
    return RNMBXWindParticlesLayerComponentView.class;
}

@end
