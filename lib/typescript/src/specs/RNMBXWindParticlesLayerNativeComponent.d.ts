import type { HostComponent, ViewProps } from 'react-native';
import { Double } from 'react-native/Libraries/Types/CodegenTypes';
import type { UnsafeMixed } from './codegenUtils';
type OptionalProp<T> = UnsafeMixed<T>;
export interface NativeProps extends ViewProps {
    id?: OptionalProp<string>;
    visible?: OptionalProp<boolean>;
    opacity?: OptionalProp<Double>;
    particleDensity?: OptionalProp<string>;
    speedMultiplier?: OptionalProp<Double>;
}
declare const _default: HostComponent<NativeProps>;
export default _default;
//# sourceMappingURL=RNMBXWindParticlesLayerNativeComponent.d.ts.map