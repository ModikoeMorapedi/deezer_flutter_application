import 'dart:convert';
import 'package:deezer_flutter_application/models/chart.dart';
import 'package:deezer_flutter_application/models/track.dart';
import 'package:deezer_flutter_application/services/base_service/base_service.dart';
import 'package:deezer_flutter_application/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'i_deerzer_web_view_service.dart';

class DeezerWebViewService extends BaseService
    implements IDeezerWebViewService {
  var client = http.Client();

  @override
  Future getAccessTokenService(String code) async {
    var url = Uri.https(deezerUrl, '/oauth/access_token.php',
        {"app_id": appId, "secret": secretId, "code": code, "output": "json"});
    try {
      final response = await client
          .get(url)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        return http.Response('Error', 500);
      });
      final accessTokenResponse =
          jsonDecode(response.body)['access_token'] as String;

      return accessTokenResponse;
    } catch (e) {
      return e;
    }
  }

  @override
  Future<Chart> getChartsService() async {
    final jsonChart = await getAsync(chartUrl);
    final jsonList = Chart.fromJson(json: jsonChart);
    return jsonList;
  }
}
