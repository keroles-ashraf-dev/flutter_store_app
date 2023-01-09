import 'app_constant.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) return AppConstant.emptyStr;
    return this!;
  }
}

extension StringToDouble on String {
  double toDouble() {
    return double.tryParse(this) ?? AppConstant.zeroDol;
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) return AppConstant.zeroInt;
    return this!;
  }
}

/// just delay emitting state
/// for beautify screen state changes
// extension EmitterSleep on Emitter {
//   Future<void> delay(state) async {
//     await sleep(seconds: UIConstant.screenChangeInterval);
//     this(state);
//   }
// }
