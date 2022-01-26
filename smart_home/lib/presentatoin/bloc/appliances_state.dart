import 'package:flutter/foundation.dart';

abstract class ApplianceState {}

class ApplianceEmptyState extends ApplianceState {}

class ApplianceLoadingState extends ApplianceState {}

class ApplianceLoadedState extends ApplianceState {
  List<dynamic> loadedAppliance;

  ApplianceLoadedState({required List loadedAppliance})
      : assert(loadedAppliance != null),
        loadedAppliance = loadedAppliance;
}

class ApplianceErrorState extends ApplianceState {}
