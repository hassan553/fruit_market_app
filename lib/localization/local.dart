import 'languages/arabic.dart';
import 'languages/english.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyLocal extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': arabic, 'en': english};
}
