import 'package:deezer_flutter_application/models/track.dart';

class Artist {
  int id;
  String name;
  String link;
  String picture;
  String pictureSmall;
  String pictureMedium;
  String pictureBig;
  String pictureXl;
  String tracklist;
  String type;
  int nbFan;
  int nbAlbum;

  Artist(
      {this.id,
      this.name,
      this.link,
      this.picture,
      this.pictureSmall,
      this.pictureMedium,
      this.pictureBig,
      this.pictureXl,
      this.tracklist,
      this.type,
      this.nbFan,
      this.nbAlbum});

  Artist.fromJson({Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    picture = json['picture'];
    pictureSmall = json['picture_small'];
    pictureMedium = json['picture_medium'];
    pictureBig = json['picture_big'];
    pictureXl = json['picture_xl'];
    tracklist = json['tracklist'];
    type = json['type'];
    nbFan = json['nb_fan'];
    nbAlbum = json['nb_album'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['picture'] = this.picture;
    data['picture_small'] = this.pictureSmall;
    data['picture_medium'] = this.pictureMedium;
    data['picture_big'] = this.pictureBig;
    data['picture_xl'] = this.pictureXl;
    data['tracklist'] = this.tracklist;
    data['type'] = this.type;
    data['nb_fan'] = this.nbFan;
    data['nb_album'] = this.nbAlbum;
    return data;
  }
}

Map<String, dynamic> artistDetails = {
  'tracklist': Track,
  'nb_fan': String,
  'artistName': String,
  'artistImage': String,
};
