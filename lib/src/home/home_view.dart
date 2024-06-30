import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';
import 'entities/anime.dart';
import '../core/widgets/icon_buttons.dart';
import '../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("Bookmarks [t:${c.timers}, r:${c.requests}]")),
        actions: [
          IconButton(
            icon: const Icon(Icons.app_shortcut),
            onPressed: () {
              Get.toNamed(Routes.TASKLIST);
            },
          ),
          const DebugIconButton(route: Routes.DEBUG),
        ],
      ),
      body: Obx(
        () => c.animeList.isNotEmpty
            ? ListView.builder(
                itemCount: c.animeList.length,
                itemBuilder: (context, index) {
                  final item = c.animeList[index];
                  return _buildCard(context, item);
                },
              )
            : const Center(child: Text('No bookmarks available')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: c.refresh,
      ),
    );
  }

  Widget _buildCard(BuildContext context, Anime item) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Get.find<HomeController>().select(item);
        Get.toNamed(Routes.DETAILS);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(context, item),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title ?? '...',
                      style: textTheme.headlineSmall!.copyWith(
                        fontSize: textTheme.headlineSmall!.fontSize! - 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${item.wiki?.mviMonth ?? 0} - ${DateFormat("HH:mm:ss.SSS").format(item.wiki?.lastUpdate ?? DateTime(2000))}',
                      style: textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "<~description~>",
                      maxLines: 2,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, Anime item) {
    return item.wiki?.image != null
        ? CachedNetworkImage(
            imageUrl: (item.wiki?.image ?? '').replaceFirst('220px', '96px'),
            placeholder: (_, __) => const SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(),
            ),
            errorWidget: (_, __, ___)
                => Icon(Icons.broken_image, color: Theme.of(context).colorScheme.error, size: 96.0),
            imageBuilder: (context, image) => ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: 96,
                height: 150,
                child: Image(image: image, fit: BoxFit.contain),
              ),
            ),
          )
        : Icon(Icons.broken_image, color: Theme.of(context).colorScheme.errorContainer, size: 96.0);
  }
}