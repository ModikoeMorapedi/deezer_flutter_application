import 'artist.dart';
import 'contributors.dart';
import 'data.dart';
import 'genre.dart';

class Album {
  int id;
  String title;
  String upc;
  String link;
  String share;
  String cover;
  String coverSmall;
  String coverMedium;
  String coverBig;
  String coverXl;
  String md5Image;
  int genreId;
  Genres genres;
  String label;
  int nbTracks;
  int duration;
  int fans;
  String releaseDate;
  String recordType;
  bool available;
  String tracklist;
  bool explicitLyrics;
  int explicitContentLyrics;
  int explicitContentCover;
  List<Contributors> contributors;
  Artist artist;
  String type;
  Genres tracks;

  Album(
      {this.id,
      this.title,
      this.upc,
      this.link,
      this.share,
      this.cover,
      this.coverSmall,
      this.coverMedium,
      this.coverBig,
      this.coverXl,
      this.md5Image,
      this.genreId,
      this.genres,
      this.label,
      this.nbTracks,
      this.duration,
      this.fans,
      this.releaseDate,
      this.recordType,
      this.available,
      this.tracklist,
      this.explicitLyrics,
      this.explicitContentLyrics,
      this.explicitContentCover,
      this.contributors,
      this.artist,
      this.type,
      this.tracks});

  Album.fromJson({Map<String, dynamic> json}) {
    id = json['id'];
    title = json['title'];
    upc = json['upc'];
    link = json['link'];
    share = json['share'];
    cover = json['cover'];
    coverSmall = json['cover_small'];
    coverMedium = json['cover_medium'];
    coverBig = json['cover_big'];
    coverXl = json['cover_xl'];
    md5Image = json['md5_image'];
    genreId = json['genre_id'];
    genres =
        json['genres'] != null ? new Genres.fromJson(json['genres']) : null;
    label = json['label'];
    nbTracks = json['nb_tracks'];
    duration = json['duration'];
    fans = json['fans'];
    releaseDate = json['release_date'];
    recordType = json['record_type'];
    available = json['available'];
    tracklist = json['tracklist'];
    explicitLyrics = json['explicit_lyrics'];
    explicitContentLyrics = json['explicit_content_lyrics'];
    explicitContentCover = json['explicit_content_cover'];
    if (json['contributors'] != null) {
      contributors = new List<Contributors>();
      json['contributors'].forEach((v) {
        contributors.add(new Contributors.fromJson(v));
      });
    }
    artist = json['artist'] != null
        ? new Artist.fromJson(json: json['artist'])
        : null;
    type = json['type'];
    tracks =
        json['tracks'] != null ? new Genres.fromJson(json['tracks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['upc'] = this.upc;
    data['link'] = this.link;
    data['share'] = this.share;
    data['cover'] = this.cover;
    data['cover_small'] = this.coverSmall;
    data['cover_medium'] = this.coverMedium;
    data['cover_big'] = this.coverBig;
    data['cover_xl'] = this.coverXl;
    data['md5_image'] = this.md5Image;
    data['genre_id'] = this.genreId;
    if (this.genres != null) {
      data['genres'] = this.genres.toJson();
    }
    data['label'] = this.label;
    data['nb_tracks'] = this.nbTracks;
    data['duration'] = this.duration;
    data['fans'] = this.fans;
    data['release_date'] = this.releaseDate;
    data['record_type'] = this.recordType;
    data['available'] = this.available;
    data['tracklist'] = this.tracklist;
    data['explicit_lyrics'] = this.explicitLyrics;
    data['explicit_content_lyrics'] = this.explicitContentLyrics;
    data['explicit_content_cover'] = this.explicitContentCover;
    if (this.contributors != null) {
      data['contributors'] = this.contributors.map((v) => v.toJson()).toList();
    }
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    data['type'] = this.type;
    if (this.tracks != null) {
      data['tracks'] = this.tracks.toJson();
    }
    return data;
  }
}
