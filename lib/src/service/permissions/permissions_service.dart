import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService extends Cubit<Map<Permission, bool>> {
  PermissionsService() : super({}) {
    _updateCurrentRequiredPermissionsGranted();
  }

  static const List<Permission> requiredPermissions = [
    Permission.notification,
    Permission.contacts,
  ];

  Future<void> requestPermission() async {
    await _updateCurrentRequiredPermissionsGranted();
    List<Permission> requestPermissionsList = state.entries
        .where((e) => e.value == false)
        .map((e) => e.key)
        .toList();
    for (Permission permission in requestPermissionsList) {
      await permission.request();
    }
  }

  Future<void> _updateCurrentRequiredPermissionsGranted() async {
    Map<Permission, bool> grantedStatus = {};
    for (Permission permission in requiredPermissions) {
      final isGranted = await permission.isGranted;
      grantedStatus[permission] = isGranted;
    }

    emit(grantedStatus);
  }
}
