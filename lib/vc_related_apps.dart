library vc_related_apps;

import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'src/app.dart';
import 'src/key.dart';
import 'src/url.dart';

export 'src/app.dart';

Future<UnmodifiableListView<App>> loadRelatedApps() async {
  List<App> apps = [];
  http.Response response = await http.get('$rootUrl$appJsonPath');
  if (response.statusCode == 200) {
    final appsData = jsonDecode(response.body)[appsKey];
    for (final appJson in appsData) {
      apps.add(App.fromDecodedJson(appJson));
    }
  }
  return UnmodifiableListView(apps);
}
