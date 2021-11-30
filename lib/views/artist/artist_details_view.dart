import 'package:cached_network_image/cached_network_image.dart';
import 'package:deezer_flutter_application/utils/views_utils/colors_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/strings_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtistDetailsView extends StatelessWidget {
  final artistDetails;
  const ArtistDetailsView({Key key, this.artistDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var trackList = artistDetails['tracklist'];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                child: CachedNetworkImage(
                  imageUrl: artistDetails['artistImage'],
                  height: 295,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                    child: Image.network(
                        'https://source.unsplash.com/weekly?coding'),
                  ),
                  errorWidget: (context, url, error) => Image.network(
                      'https://source.unsplash.com/weekly?coding'),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        ColorsUtils.blackColor,
                        ColorsUtils.midnightBlue.withOpacity(0.2)
                      ],
                      begin: Alignment(0, 0.57),
                      end: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 230,
                top: 20.0,
                right: 200,
                width: 350,
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  color: Colors.white,
                  iconSize: 23,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                  bottom: 5,
                  top: 230.0,
                  left: 30,
                  width: 350,
                  child: Text(
                    artistDetails['artistName'],
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: 30,
            ),
            alignment: Alignment.bottomLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(top: 8, right: 30),
                child: const Text(StringsUtils.top5Tracks,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              )
            ]),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.only(left: 30, top: 15),
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.only(right: 17),
                          height: 20,
                          child: Container(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                trackList[index].title,
                                maxLines: 2,
                                style: TextStyle(color: Colors.black),
                              ))),
                    )),
          ),
        ],
      ),
    ));
  }
}
