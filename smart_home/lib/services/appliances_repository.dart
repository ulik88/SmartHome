import 'package:smart_home/models/appliances.dart';
import 'package:smart_home/services/appliance_api_provider.dart';

class AppliancesRepository {
  ApplianceProvider _applianceProvider = ApplianceProvider();
  Future<List<Appliance>> getAllAppliance() =>
      _applianceProvider.getAppliance();
}
