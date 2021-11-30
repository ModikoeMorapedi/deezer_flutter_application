import 'package:deezer_flutter_application/services/artist/artist_service.dart';
import 'package:deezer_flutter_application/services/artist/i_artist_service.dart';
import 'package:deezer_flutter_application/services/deerzer/deezer_web_view_service.dart';
import 'package:deezer_flutter_application/services/deerzer/i_deerzer_web_view_service.dart';
import 'package:deezer_flutter_application/view_Models/artist_view_model.dart';
import 'package:deezer_flutter_application/view_models/deezer_web_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  //interfaces
  locator.registerLazySingleton<IDeezerWebViewService>(
      () => DeezerWebViewService());
  locator.registerLazySingleton<IArtistService>(() => ArtistService());
  //Services
  locator.registerLazySingleton<ArtistService>(() => ArtistService());
  locator.registerLazySingleton<DeezerWebViewService>(
      () => DeezerWebViewService());
  //ViewModels
  locator.registerFactory<ArtistViewModel>(() => ArtistViewModel());
  locator.registerFactory<DeezerWebViewModel>(() => DeezerWebViewModel());
}
