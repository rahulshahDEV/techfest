import 'package:auto_route/auto_route.dart';
import 'package:byrahul/app_router/route_import.gr.dart';
import 'package:byrahul/utils/themes/palette.dart';
import 'package:flutter/material.dart';

class CustomDashboardCard extends StatelessWidget {
  const CustomDashboardCard(
      {super.key,
      required this.slug,
      required this.id,
      required this.featuredImage,
      required this.title});

  final String title;
  final String id;
  final String slug;
  final String featuredImage;

  // "id": "669a075c9d435f7cd30e1992",
  //           "title": "team",
  //           "slug": "team",
  //           "featuredImage": {
  //               "url": "http://10.0.2.2:3000/uploads/media/2024/7/19/61zrdfaacdl._ac_sl1500_.jpg",
  //               "name": "61zrdfaacdl._ac_sl1500_.jpg"
  //           },

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      height: 90,
      // width: MediaQuery.of(context).size.width * 0.89,
      decoration: BoxDecoration(
        color: Palette.territory_white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              blurRadius: 0.5,
              color: Colors.grey,
              offset: Offset(
                0.25,
                0.25,
              ),
              spreadRadius: 0.5),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 1,
                      color: Colors.black26,
                      offset: Offset(
                        1,
                        1,
                      ),
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(featuredImage), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              overflow: TextOverflow.fade,
              title,
              style: TextStyle(color: Palette.primary),
            ),
          )
        ],
      ),
    );
  }
}
