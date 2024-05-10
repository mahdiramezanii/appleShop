import 'package:url_launcher/url_launcher.dart';

abstract class UrlHandller {
  void openUrl(String uri);
}

class UrlLuncher extends UrlHandller {
  @override
  void openUrl(String uri) {
    launchUrl(Uri.parse(uri));
  }
}
