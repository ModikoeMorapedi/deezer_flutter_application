import 'album.dart';
import 'artist.dart';

class Chart {
  Tracks tracks;
  Tracks albums;
  Tracks artists;
  Tracks playlists;
  Tracks podcasts;

  Chart(
      {this.tracks, this.albums, this.artists, this.playlists, this.podcasts});

  Chart.fromJson({Map<String, dynamic> json}) {
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    albums =
        json['albums'] != null ? new Tracks.fromJson(json['albums']) : null;
    artists =
        json['artists'] != null ? new Tracks.fromJson(json['artists']) : null;
    playlists = json['playlists'] != null
        ? new Tracks.fromJson(json['playlists'])
        : null;
    podcasts =
        json['podcasts'] != null ? new Tracks.fromJson(json['podcasts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tracks != null) {
      data['tracks'] = this.tracks.toJson();
    }
    if (this.albums != null) {
      data['albums'] = this.albums.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.toJson();
    }
    if (this.playlists != null) {
      data['playlists'] = this.playlists.toJson();
    }
    if (this.podcasts != null) {
      data['podcasts'] = this.podcasts.toJson();
    }
    return data;
  }
}

class Tracks {
  List<Data> data;
  int total;

  Tracks({this.data, this.total});

  Tracks.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int id;
  String title;
  String titleShort;
  String titleVersion;
  String link;
  int duration;
  int rank;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  String preview;
  String md5Image;
  int position;
  Artist artist;
  Album album;
  String type;

  Data(
      {this.id,
      this.title,
      this.titleShort,
      this.titleVersion,
      this.link,
      this.duration,
      this.rank,
      this.explicitLyrics,
      this.explicitContentLyrics,
      this.explicitContentCover,
      this.preview,
      this.md5Image,
      this.position,
      this.artist,
      this.album,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleShort = json['title_short'];
    titleVersion = json['title_version'];
    link = json['link'];
    duration = json['duration'];
    rank = json['rank'];
    explicitLyrics = json['explicit_lyrics'];
    explicitContentLyrics = json['explicit_content_lyrics'];
    explicitContentCover = json['explicit_content_cover'];
    preview = json['preview'];
    md5Image = json['md5_image'];
    position = json['position'];
    artist = json['artist'] != null
        ? new Artist.fromJson(json: json['artist'])
        : null;
    album =
        json['album'] != null ? new Album.fromJson(json: json['album']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_short'] = this.titleShort;
    data['title_version'] = this.titleVersion;
    data['link'] = this.link;
    data['duration'] = this.duration;
    data['rank'] = this.rank;
    data['explicit_lyrics'] = this.explicitLyrics;
    data['explicit_content_lyrics'] = this.explicitContentLyrics;
    data['explicit_content_cover'] = this.explicitContentCover;
    data['preview'] = this.preview;
    data['md5_image'] = this.md5Image;
    data['position'] = this.position;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}
