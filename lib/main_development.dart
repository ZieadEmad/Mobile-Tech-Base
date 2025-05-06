import 'package:arch/core/helpers/build_config.dart';
import 'package:arch/main.dart';


void main() {
  BuildConfig.flavor = Flavor.development;
  appMain();
}
