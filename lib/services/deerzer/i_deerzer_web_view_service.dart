import 'package:deezer_flutter_application/models/chart.dart';

abstract class IDeezerWebViewService {
  Future getAccessTokenService(String code);
  Future<Chart> getChartsService();
}
