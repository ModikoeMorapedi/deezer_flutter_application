import 'package:deezer_flutter_application/models/album.dart';
import 'package:deezer_flutter_application/models/artist.dart';
import 'package:deezer_flutter_application/models/track.dart';
import 'package:deezer_flutter_application/scoped_models/base_model.dart';
import 'package:deezer_flutter_application/services/artist/artist_service.dart';
import 'package:deezer_flutter_application/services/artist/i_artist_service.dart';
import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:deezer_flutter_application/utils/locator.dart';

class ArtistViewModel extends BaseModel {
  final IArtistService _iArtistService = locator<IArtistService>();
  Artist artist;
  String _name;
  String get name => _name;
  List<Artist> artistsList = [];
  List<Track> tracklistList = [];

  Future getArtistInfo(String artistName) async {
    setState(ViewState.Busy);
    try {
      final artistResponse =
          await _iArtistService.getArtistInfoService(artistName);
      if (artistResponse != null) {
        artistsList = artistResponse;

        setState(ViewState.DataFetched);
      } else {
        setState(ViewState.Error);
      }
    } catch (err) {
      setFailureState(err);
    }
  }

  Future getTracklist(String artistName) async {
    setState(ViewState.Busy);
    try {
      final tracklistResponse =
          await _iArtistService.getTracklistService(artistName);
      if (tracklistResponse != null) {
        tracklistList = tracklistResponse;

        setState(ViewState.DataFetched);
      } else {
        setState(ViewState.Error);
      }
    } catch (err) {
      setFailureState(err);
    }
  }
}
