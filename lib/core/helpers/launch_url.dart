import 'package:clean_arch_bookly_app/core/helpers/functions/build_error_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomURL(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      buildErrorWidget('Could not launch $url');
    }
  }
}
