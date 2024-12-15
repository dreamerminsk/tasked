import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'src/debug/debug_binding.dart';
import 'src/routes/app_pages.dart';
import 'src/core/theme_notifier.dart';

void main() => runApp(TaskedApp());

class TaskedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier.random()),
      ],
      child: TaskedAppWithTheme(),
    );
  }
}

class TaskedAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    return GetMaterialApp(
      title: 'tasked',
      theme: theme.theme,
      initialBinding: DebugBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
