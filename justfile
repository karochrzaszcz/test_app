get:
  fvm flutter pub get

run_builder:
  fvm flutter pub run build_runner build --delete-conflicting-outputs

translate:
  fvm flutter pub run easy_localization:generate -f keys -O lib/presentation/i18n --output-file locale_keys.g.dart --source-dir assets/translations
  
gen:
  just get
  fvm flutter pub run build_runner build --delete-conflicting-outputs
  just translate

analyze:
  fvm flutter analyze

test:
  fvm flutter test
  
format:
  fvm dart format . --fix

check:
  just analyze
  just test
  fvm dart format . --set-exit-if-changed
