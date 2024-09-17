/// enum that identifies the current state of UI
enum CentralViewState { busy, idle, none }

/// [ToastStats] is an enum that represents different states or types of toast
/// messages that can be displayed in a user interface. These states include error,
/// info, warning, and success.
enum ToastStats { error, info, warning, success }

enum TabType {
  days("days"),
  weeks("weeks"),
  months("month");

  final String value;

  const TabType(this.value);
}

enum GenderType {
  male("Male"),
  female("Female"),
  nonBinary("Non-binary"),
  notListed("Not Listed"),
  other("Other"),
  unKnown("unKnown");

  final String value;

  const GenderType(this.value);
}

enum HiveConstantsBox {
  //
  hiveBoxDB('hiveBoxDB');

  final String value;

  const HiveConstantsBox(this.value);
}

enum HiveConstantsKey {
  //
  hiveLocalDBKey('hiveLocalDBKey');

  final String value;

  const HiveConstantsKey(this.value);
}
