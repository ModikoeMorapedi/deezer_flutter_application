import 'dart:ffi';

import 'package:deezer_flutter_application/models/chart.dart';
import 'package:deezer_flutter_application/scoped_models/base_model.dart';
import 'package:deezer_flutter_application/services/deerzer/i_deerzer_web_view_service.dart';
import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:deezer_flutter_application/utils/locator.dart';

class DeezerWebViewModel extends BaseModel {
  final IDeezerWebViewService _iDeezerWebViewService =
      locator<IDeezerWebViewService>();

  static String accessToken;
  Chart charts;

  Future<Void> getAccessToken(String code) async {
    setState(ViewState.Busy);
    try {
      final response = await _iDeezerWebViewService.getAccessTokenService(code);
      if (response != null) {
        accessToken = response;
        setState(ViewState.DataFetched);
      } else {
        setState(ViewState.Error);
      }
    } catch (err) {
      setFailureState(err);
    }
  }

  Future<Void> getCharts() async {
    setState(ViewState.Busy);
    try {
      final response = await _iDeezerWebViewService.getChartsService();
      if (response != null) {
        charts = response;
        setState(ViewState.DataFetched);
      } else {
        setState(ViewState.Error);
      }
    } catch (err) {
      setFailureState(err);
    }
  }
}
