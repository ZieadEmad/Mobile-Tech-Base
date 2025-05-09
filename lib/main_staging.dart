import 'package:arch/core/data/network/utill/configration.dart';
import 'package:arch/injection/injection.dart';
import 'package:arch/main.dart';


void main()async {
  // BuildConfig.flavor = Flavor.staging;
  await configureInjection(AppEnvironment.staging);

 await appMain();
}
