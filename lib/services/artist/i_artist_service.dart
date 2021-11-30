import 'package:deezer_flutter_application/models/artist.dart';
import 'package:deezer_flutter_application/models/track.dart';

abstract class IArtistService {
  Future<List<Artist>> getArtistInfoService(String artist);
  Future<List<Track>> getTracklistService(String url);
}
