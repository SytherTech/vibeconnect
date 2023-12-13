import 'package:get/get.dart';

import 'en_US.dart';
import 'ro_RU.dart';

class TranslationSerivce extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ro_RU': roRU,
      };
}
