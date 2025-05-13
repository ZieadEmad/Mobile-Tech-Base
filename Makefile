# Makefile for Flutter project

run:

	flutter run

build-apk:

	flutter build apk --release

build-ios:

	flutter build ios --release

clean:

	flutter clean

get:

	flutter pub get

test:

	flutter test

analyze:

	flutter analyze

easy_localization:

	flutter pub run easy_localization:generate -S "assets/translations" -O "lib/core/helper/translations" -o "locale_keys.g.dart"  -f keys
	flutter pub run easy_localization:generate -S "assets/translations" -O "lib/core/helper/translations"



