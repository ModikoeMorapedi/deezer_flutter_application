import 'package:deezer_flutter_application/models/artist.dart';
import 'package:deezer_flutter_application/views/artist/artist_details_view.dart';
import 'package:deezer_flutter_application/views/artist/artists_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/ArtistDetailsView':
        return MaterialPageRoute(
            builder: (_) => ArtistDetailsView(
                  artistDetails: artistDetails,
                ));
      case '/ArtistsView':
        var chart = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ArtistsView(
                  chart: chart,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for  ${settings.name}')),
                ));
    }
  }
}
