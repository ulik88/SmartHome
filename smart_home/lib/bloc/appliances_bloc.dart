import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/bloc/appliances_event.dart';
import 'package:smart_home/bloc/appliances_state.dart';
import 'package:smart_home/models/appliances.dart';
import 'package:smart_home/services/appliances_repository.dart';

class ApplianceBloc extends Bloc<ApplianceEvent, ApplianceState> {
  final AppliancesRepository appliancesRepository;

  ApplianceBloc({this.appliancesRepository})
      : assert(appliancesRepository != null),
        super(null);

  ApplianceState get initialState => ApplianceEmptyState();

  @override
  Stream<ApplianceState> mapEventToState(ApplianceEvent event) async* {
    if (event is ApplianceLoadEvent) {
      yield ApplianceLoadingState();
      try {
        final List<Appliance> _loadedApplianceList =
            await appliancesRepository.getAllAppliance();
        yield ApplianceLoadedState(loadedAppliance: _loadedApplianceList);
      } catch (_) {
        yield ApplianceErrorState();
      }
    } else if (event is ApplianceClearEvent) {
      yield ApplianceEmptyState();
    }
  }
}
