library threshold_eng_apps;

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:threshold_eng_apps/src/app.dart';
import 'package:threshold_eng_apps/src/key.dart';

export 'src/app.dart';

Future<UnmodifiableListView<App>> loadTEApps() async {
  final List<App> apps = [];
  final appsUrl = Uri.https('api.thresholdeng.com', 'apps');
  final response = await http.get(appsUrl);
  if (response.statusCode == 200) {
    final appsData = jsonDecode(response.body)[appsKey];
    for (final appJson in appsData) {
      apps.add(App.fromDecodedJson(appJson));
    }
  }
  return UnmodifiableListView(apps);
}
