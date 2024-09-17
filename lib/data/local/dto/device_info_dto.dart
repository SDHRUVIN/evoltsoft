import 'dart:convert';

class DeviceInfoDTO {
  String? deviceName;
  String? osVersion;
  String? osType;
  double? heightPX;

  DeviceInfoDTO({this.deviceName, this.osVersion, this.osType,this.heightPX});

  DeviceInfoDTO.fromJson(Map<String, dynamic> json) {
    deviceName = json['device_name'];
    osVersion = json['os_version'];
    osType = json['os_type'];
    heightPX = json['heightPX'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_name'] = deviceName;
    data['os_version'] = osVersion;
    data['os_type'] = osType;
    data['heightPX'] = heightPX;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
