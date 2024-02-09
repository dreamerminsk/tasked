import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';
import 'entities/anime.dart';
import '../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(context) {
    final HomeController c = Get.find();

    return Scaffold(
        appBar: AppBar(
            title:
                Obx(() => Text("Bookmarks [t:${c.timers}, r:${c.requests}]")),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.app_shortcut),
                onPressed: () {
                  Get.toNamed(Routes.WATCHLIST);
                },
              ),
              IconButton(
                icon: Icon(Icons.query_stats),
                onPressed: () {
                  Get.toNamed(Routes.DEBUG);
                },
              ),
            ]),
        body: Obx(() => c.animeList.length > 0
            ? ListView.builder(
                itemCount: c.animeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        c.select(index);
                        Get.toNamed(Routes.DETAILS);
                      },
                      child: _buildCard(context, c.animeList[index]));
                },
              )
            : const Center(child: Text('No items'))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh), onPressed: c.refresh));
  }

  Widget _buildCard(BuildContext context, Anime item) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildImage(context, item),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 4),
                      Text(
                        item.title ?? '...',
                        style: textTheme.headlineSmall!.copyWith(
                          fontSize: textTheme.headlineSmall!.fontSize! - 1,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${item.wiki?.mviMonth ?? 0} - ${DateFormat("HH:mm:ss.SSS").format(item.wiki?.lastUpdate ?? DateTime(2000))}',
                        style: textTheme.bodyLarge!,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "<~description~>",
                        maxLines: 2,
                        style: textTheme.bodyLarge!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, Anime item) {
    return item.wiki?.image != null
        ? CachedNetworkImage(
            imageUrl: (item.wiki?.image ?? '').replaceFirst('220px', '96px'),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Icon(Icons.broken_image, color: Theme.of(context).colorScheme.error, size: 96.0),
            imageBuilder: (context, image) =>
ClipRRect( 
borderRadius: BorderRadius.circular(16),
child: Container(
              width: 96.00,
              height: 150.00,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
),
          )
        : Icon(Icons.image_not_supported, color: Colors.blueGrey, size: 96.0);
  }
}
