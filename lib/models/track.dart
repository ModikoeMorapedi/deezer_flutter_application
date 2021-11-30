import 'album.dart';
import 'artist.dart';
import 'contributors.dart';

class Track {
  int id;
  bool readable;
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
  List<Contributors> contributors;
  String md5Image;
  Artist artist;
  Album album;
  String type;

  Track(
      {this.id,
      this.readable,
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
      this.contributors,
      this.md5Image,
      this.artist,
      this.album,
      this.type});

  Track.fromJson({Map<String, dynamic> json}) {
    id = json['id'];
    readable = json['readable'];
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
    if (json['contributors'] != null) {
      contributors = new List<Contributors>();
      json['contributors'].forEach((v) {
        contributors.add(new Contributors.fromJson(v));
      });
    }
    md5Image = json['md5_image'];
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
    data['readable'] = this.readable;
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
    if (this.contributors != null) {
      data['contributors'] = this.contributors.map((v) => v.toJson()).toList();
    }
    data['md5_image'] = this.md5Image;
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
