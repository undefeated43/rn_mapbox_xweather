import type { HostComponent, ViewProps } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
// @ts-ignore - CI environment type resolution issue for CodegenTypes
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

export default codegenNativeComponent<NativeProps>(
  'RNMBXWindParticlesLayer',
) as HostComponent<NativeProps>;
