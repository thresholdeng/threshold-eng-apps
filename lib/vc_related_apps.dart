library vc_related_apps;

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'src/app.dart';
import 'src/key.dart';

export 'src/app.dart';

final _appsJsonUrl = 'https://www.vicentecaycedo.com/apps.json';

Future<UnmodifiableListView<App>> loadRelatedApps() async {
  List<App> apps = [];
  http.Response response = await http.get(_appsJsonUrl);
  if (response.statusCode == 200) {
    final appsData = jsonDecode(response.body)[appsKey];
    for (final appJson in appsData) {
      apps.add(App.fromDecodedJson(appJson));
    }
  }
  return UnmodifiableListView(apps);
}
