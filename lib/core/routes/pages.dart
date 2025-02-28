import '../../modules/home/home.dart';
import 'constants.dart';

class Pages {
  static get pages {
    return {
      Routes.home: (ctx) => const HomePage(),
    };
  }
}