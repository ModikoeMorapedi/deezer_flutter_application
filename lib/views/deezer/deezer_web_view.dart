import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:deezer_flutter_application/view_models/deezer_web_view_model.dart';
import 'package:deezer_flutter_application/views/artist/artists_view.dart';
import 'package:deezer_flutter_application/widgets/busy_indicators/busy_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../base_view.dart';

class DeezerWebView extends StatelessWidget {
  static String accessToken;
  const DeezerWebView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DeezerWebViewModel>(
        builder: (context, child, model) => BusyOverlayWidget(
            color: Colors.white,
            textColor: Colors.black,
            progressColor: Colors.black,
            show: model.state == ViewState.Busy,
            child: Scaffold(
              body: WebView(
                initialUrl:
                    'https://connect.deezer.com/oauth/auth.php?app_id=514422&redirect_uri=https://www.momentum.co.za/momentum/home',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {},
                navigationDelegate: (NavigationRequest request) async {
                  var uri = Uri.dataFromString(request.url);
                  var code = uri.queryParameters["code"];
                  if (uri.queryParameters["code"] != null &&
                      uri.queryParameters["code"] != "") {
                    await model.getAccessToken(code);
                    if (model.state == ViewState.DataFetched) {
                      await model.getCharts();
                      if (model.state == ViewState.DataFetched) {
                        Navigator.pushNamed(context, '/ArtistsView',
                            arguments: model.charts);
                      }
                    } else {}
                  }
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                },
              ),
            )));
  }
}
