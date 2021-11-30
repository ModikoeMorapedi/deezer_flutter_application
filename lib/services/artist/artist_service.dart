import 'package:deezer_flutter_application/models/album.dart';
import 'package:deezer_flutter_application/models/artist.dart';
import 'package:deezer_flutter_application/models/track.dart';
import 'package:deezer_flutter_application/services/artist/i_artist_service.dart';
import 'package:deezer_flutter_application/services/base_service/base_service.dart';
import 'package:deezer_flutter_application/utils/constants.dart';

class ArtistService extends BaseService implements IArtistService {
  @override
  Future<List<Artist>> getArtistInfoService(String artist) async {
    final urlArtist = "$searchUrl/artist?q=$artist";
    final List<Artist> artistsList = [];

    final jsonArtist = await getAsync(urlArtist);
    final jsonList = jsonArtist['data'] as List;

    if (jsonList != null) {
      artistsList.addAll((jsonList).map((e) => Artist.fromJson(json: e)));
    }
    return artistsList;
  }

  @override
  Future<List<Track>> getTracklistService(String url) async {
    final List<Track> trackList = [];

    final tracksResponse = await getAsync(url);
    final jsonList = tracksResponse['data'] as List;

    if (jsonList != null) {
      trackList.addAll((jsonList).map((e) => Track.fromJson(json: e)));
    }
    return trackList;
  }
}
