import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventsAndNewsScreen extends StatefulWidget {
  const EventsAndNewsScreen({Key? key}) : super(key: key);

  @override
  State<EventsAndNewsScreen> createState() => _EventsAndNewsScreenState();
}

class _EventsAndNewsScreenState extends State<EventsAndNewsScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://mississaugaramblers.com/news/'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
