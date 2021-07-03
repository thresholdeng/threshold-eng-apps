import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:threshold_eng_apps/src/key.dart';

class App {
  App({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.iconUrl,
    @required this.appStore,
    @required this.playStore,
  });

  App.fromJson(dynamic json) : this.fromDecodedJson(jsonDecode(json));

  App.fromDecodedJson(dynamic decodedJson)
      : this(
          id: decodedJson[idKey],
          title: decodedJson[titleKey],
          description: decodedJson[descriptionKey],
          iconUrl: decodedJson[iconKey],
          appStore: decodedJson[appStoreKey],
          playStore: decodedJson[playStoreKey],
        );

  final String id;
  final String title;
  final String description;
  final String iconUrl;
  final String appStore;
  final String playStore;

  String get storeLink {
    if (Platform.isIOS) {
      return appStore;
    }

    if (Platform.isAndroid) {
      return playStore;
    }

    throw UnsupportedError('Unsupported Platform');
  }

  @override
  bool operator ==(other) {
    return other is App &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.iconUrl == iconUrl &&
        other.appStore == appStore &&
        other.playStore == playStore;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'App {\n'
        '  id: $id,\n'
        '  title: $title,\n'
        '  description: $description,\n'
        '  iconUrl: $iconUrl,\n'
        '  appStore: $appStore,\n'
        '  playStore: $playStore,\n'
        '}';
  }
}
