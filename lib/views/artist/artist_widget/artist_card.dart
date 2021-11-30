import 'package:cached_network_image/cached_network_image.dart';
import 'package:deezer_flutter_application/utils/views_utils/images_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/sizes_utils.dart';
import 'package:deezer_flutter_application/utils/views_utils/strings_utils.dart';
import 'package:flutter/material.dart';

class ArtistCardWidget extends StatelessWidget {
  final String artistImage;
  final String artistNbFans;
  final String artistNbAlbum;
  final String artistName;

  const ArtistCardWidget(
      {Key key,
      this.artistImage,
      this.artistNbAlbum,
      this.artistNbFans,
      this.artistName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
            color: Colors.green[200],
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10),
            height: Sizes.phoneHeight * 12,
            child: Row(children: [
              Container(
                child: CachedNetworkImage(
                  imageUrl: artistImage,
                  fit: BoxFit.fill,
                  width: Sizes.phoneWidth * 20,
                  height: Sizes.phoneHeight * 12,
                  placeholder: (context, url) => Center(
                    child: Image.asset(
                      AppImages.placeholderImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.placeholderImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            artistName,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size_12),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: RichText(
                                    text: TextSpan(
                                        text: StringsUtils.fans + " ",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: artistNbFans,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight
                                                      .bold) // dataAmount: TransferAirtimeViewModel.tranferAmount.toString(),
                                              ),
                                        ]),
                                  ),
                                ),
                                artistNbAlbum != null
                                    ? RichText(
                                        text: TextSpan(
                                            text: StringsUtils.album + " ",
                                            style: TextStyle(
                                              color: Colors.amber[900],
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: artistNbAlbum,
                                                  style: TextStyle(
                                                      color: Colors.amber[900],
                                                      fontWeight: FontWeight
                                                          .bold) // dataAmount: TransferAirtimeViewModel.tranferAmount.toString(),
                                                  ),
                                            ]),
                                      )
                                    : const Text(StringsUtils.noFansAvailable)
                              ],
                            ))
                      ]))
            ])));
  }
}
