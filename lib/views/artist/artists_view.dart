import 'package:cached_network_image/cached_network_image.dart';
import 'package:deezer_flutter_application/models/artist.dart';
import 'package:deezer_flutter_application/models/chart.dart';
import 'package:deezer_flutter_application/utils/enums/view_state_enum.dart';
import 'package:deezer_flutter_application/utils/locator.dart';
import 'package:deezer_flutter_application/utils/views_utils/images_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/sizes_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/strings_utils.dart';
import 'package:deezer_flutter_application/view_Models/artist_view_model.dart';
import 'package:deezer_flutter_application/view_models/deezer_web_view_model.dart';
import 'package:deezer_flutter_application/widgets/TextFields/search_text_field_widget.dart';
import 'package:deezer_flutter_application/widgets/busy_indicators/busy_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../base_view.dart';
import 'artist_widget/artist_card.dart';
import 'artist_widget/charts.dart';

class ArtistsView extends StatefulWidget {
  final Chart chart;
  const ArtistsView({Key key, this.chart}) : super(key: key);

  @override
  _ArtistsViewState createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> {
  String enteredArtist;
  String name;
  Chart _chart;
  final DeezerWebViewModel _deezerWebViewModel = locator<DeezerWebViewModel>();

  @override
  void initState() {
    super.initState();

    if (widget.chart != null) {
      _chart = widget.chart;
    } else {
      _chart = null;
    }
  }

  @override
  Widget build(BuildContexcontext) {
    return BaseView<ArtistViewModel>(
        builder: (context, child, model) => BusyOverlayWidget(
            color: Colors.black,
            textColor: Colors.yellow,
            progressColor: Colors.yellow,
            show: model.state == ViewState.Busy,
            child: WillPopScope(
                onWillPop: () => Future.value(false),
                child: Scaffold(
                    backgroundColor: Colors.black,
                    resizeToAvoidBottomInset: false,
                    body: Container(
                        padding: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              artistSearchBar(model),
                              _chart != null
                                  ? artistCharts()
                                  : artistList(model)
                            ]))))));
  }

  Widget artistSearchBar(ArtistViewModel model) {
    return Container(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(StringsUtils.findTheBestMusic,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size_16,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    width: Sizes.phoneWidth * 69,
                    child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.redAccent,
                          primaryColorDark: Colors.red,
                        ),
                        child: SearchTextFieldWidget(
                          onChanged: (String value) {
                            if (value != null) {
                              enteredArtist = value;
                            }
                          },
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await model.getArtistInfo(enteredArtist);
                        if (model.state == ViewState.DataFetched) {
                          _chart = null;
                          name = model.name;
                        }
                      },
                    ),
                  )
                ])
          ],
        ));
  }

  Widget artistCharts() {
    return Expanded(
        child: ListView(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 50),
            height: 25,
            child: Text(StringsUtils.charts,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: Sizes.size_16,
                    fontWeight: FontWeight.bold))),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: _chart.tracks.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Center(
                child: ChatsWidget(
              title: _chart.tracks.data[index].title,
              subTitle: _chart.tracks.data[index].titleShort.toString(),
            ));
          },
        )
      ],
    ));
  }

  Widget artistList(ArtistViewModel model) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.artistsList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  await model.getTracklist(model.artistsList[index].tracklist);
                  if (model.state == ViewState.DataFetched) {
                    Navigator.pushNamed(context, '/ArtistDetailsView',
                        arguments: artistDetails = {
                          'tracklist': model.tracklistList,
                          'nb_fan': model.artistsList[index].nbFan.toString(),
                          'artistImage': model.artistsList[index].pictureMedium,
                          'artistName': model.artistsList[index].name
                        });
                  }
                },
                child: ArtistCardWidget(
                  artistImage: model.artistsList[index].pictureMedium,
                  artistName: model.artistsList[index].name,
                  artistNbFans: model.artistsList[index].nbFan.toString(),
                  artistNbAlbum: model.artistsList[index].nbAlbum.toString(),
                ))));
  }
}
