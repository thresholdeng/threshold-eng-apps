import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'key.dart';
import 'url.dart';

class App {
  final String id;
  final String title;
  final String description;
  final String iconPath;
  final String appStore;
  final String playStore;

  App({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.iconPath,
    @required this.appStore,
    @required this.playStore,
  });

  App.fromJson(dynamic json) : this.fromDecodedJson(jsonDecode(json));

  App.fromDecodedJson(dynamic decodedJson)
      : this(
          id: decodedJson[idKey],
          title: decodedJson[titleKey],
          description: decodedJson[descriptionKey],
          iconPath: decodedJson[iconKey],
          appStore: decodedJson[appStoreKey],
          playStore: decodedJson[playStoreKey],
        );

  Future<Image> get icon async => Image.network('$rootUrl$iconPath');

  String get storeLink {
    if (Platform.isIOS) {
      return appStore;
    }

    if (Platform.isAndroid) {
      return playStore;
    }

    throw new UnsupportedError('Unsupported Platform');
  }

  @override
  bool operator ==(other) {
    return other is App &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.iconPath == iconPath &&
        other.appStore == appStore &&
        other.playStore == playStore;
  }

  @override
  int get hashCode => id.hashCode;
}
