import 'package:arch/core/core/data/network/utill/configration.dart';
import 'package:arch/injection/injection.dart';
import 'package:arch/main.dart';

void main() async{
  // BuildConfig.flavor = Flavor.development;
  await configureInjection(AppEnvironment.dev);

  await appMain();
}
