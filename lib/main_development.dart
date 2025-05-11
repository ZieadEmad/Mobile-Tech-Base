import 'package:arch/core/data/network/utill/build_config.dart';
import 'package:arch/main.dart';

void main() async{
  BuildConfig.flavor = Flavor.development;
 await appMain();
}