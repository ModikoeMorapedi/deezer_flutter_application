import 'dart:convert';

import 'package:deezer_flutter_application/services/base_service/i_base_service.dart';
import 'package:deezer_flutter_application/utils/Exceptions/services_exception.dart';
import 'package:deezer_flutter_application/view_models/deezer_web_view_model.dart';
import 'package:http/http.dart' as http;

class BaseService extends IBaseService {
  @override
  Future postAsync(Uri url, Object body, Map<String, String> hearders) {
    // TODO: implement postAsync
    throw UnimplementedError();
  }

  @override
  Future getAsync(String url) async {
    String accessToken = DeezerWebViewModel.accessToken;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': "Bearer$accessToken"
      }).timeout(const Duration(seconds: 30), onTimeout: () {
        return http.Response('Error', 500);
      });

      if (response.statusCode != 200) {
        throw ServiceException.returnResponse(response);
      }
      return json.decode(response.body);
    } catch (err) {
      return err;
    }
  }
}
