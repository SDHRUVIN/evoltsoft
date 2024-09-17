/*
import 'package:permission_handler/permission_handler.dart';
import 'package:pulse_ring/core/utils/typedefs.dart';

abstract class GrantPermissionStrategy {
  final Permission permission;

  GrantPermissionStrategy(this.permission);

  Future<void> request({
    required final OnPermanentlyDenied onPermanentlyDenied,
    required final OnPermissionDenied onPermissionDenied,
    required final OnGranted onGranted,
  }) async {
    PermissionStatus status = await permission.status;
    // debugPrint("GrantPermissionStrategy status: $status");
    if (status.isPermanentlyDenied) {
      onPermanentlyDenied.call();
      return;
    }

    if (!status.isLimited && !status.isGranted) {
      final PermissionStatus result = await permission.request();
      // debugPrint(result.index.toString());
      if (result.isDenied) {
        onPermissionDenied.call();
        return;
      }
      if (result.isPermanentlyDenied) {
        onPermanentlyDenied.call();
        return;
      }
    }
    onGranted.call();
  }
}
*/
