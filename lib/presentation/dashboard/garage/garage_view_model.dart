import 'dart:developer';

import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/core/services/env/env.dart';
import 'package:evoltsoft/core/services/network/api_service.dart';
import 'package:evoltsoft/domain/index.dart';
import 'package:evoltsoft/generated/l10n.dart';

class GarageViewModel extends BaseModel {
  //
  List<CarResponseEntity> carList = [];

  @override
  void onInit() {
    fetchAllVehicleList();
    super.onInit();
  }

  Future<void> fetchAllVehicleList() async {
    //
    Utils.isInternetAvailable().then((isConnected) {
      //
      if (isConnected) {
        //
        setViewState(CentralViewState.busy);
        ApiService.getRequest(
          url: EnvConfig().carListUrl,
          onSuccess: (data) {
            //
            log(data.toString(), name: "Car list data");
            try {
              carList.addAll(CarResponseEntity.fromJsonArray(data));
            } catch (exception) {
              log("$exception", name: "exception");
            }
            setViewState(CentralViewState.idle);
          },
          onError: (error) {
            //
            showToast(
              message: error.message,
              state: ToastStats.error,
            );
            setViewState(CentralViewState.idle);
          },
          progressCount: (count, total) {
            //
            setViewState(CentralViewState.idle);
          },
        );
      } else {
        setViewState(CentralViewState.idle);
        showToast(
          message: S
              .of(navigationService.navigationKey.currentContext!)
              .no_internet_connection,
        );
      }
    });
  }
}
