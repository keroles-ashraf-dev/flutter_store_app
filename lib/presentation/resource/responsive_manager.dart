import 'size_manager.dart';

class Responsive {
  static const double minTabWidth = 600;

  static isMob() {
    return AppSize.width < minTabWidth;
  }
}
