import 'package:flutter_test/flutter_test.dart';
import 'package:threshold_eng_apps/threshold_eng_apps.dart';

void main() {
  test('Threshold Eng apps are correctly retrieved', () async {
    // This test depends on the data currently hosted online.
    // It's not worth the trouble of mocking this data, etc.
    // Test last updated: 07/03/21.
    final p10sk = App(
      id: 'com.vicentecaycedo.phase10scorekeeper',
      title: 'Phase 10 Score Keeper',
      description: 'The ultimate companion app for the Phase 10 card game.'
          ' Easily keep track of phases and points!',
      iconUrl: 'https://api.thresholdeng.com/apps/icons/p10sk',
      appStore: 'https://apps.apple.com/us/app/id1257116642',
      playStore: 'https://play.google.com/store/apps/details?'
          'id=com.vicentecaycedo.phase10scorekeeper&hl=en_US',
    );
    final cdn = App(
      id: 'com.vicentecaycedo.cluedetectivenotebook',
      title: 'Clue Detective Notebook',
      description: 'The ultimate companion app for Clue - the Classic Murder '
          'Mystery Game.',
      iconUrl: 'https://api.thresholdeng.com/apps/icons/cdn',
      appStore: 'https://apps.apple.com/us/app/id1330273449',
      playStore: 'https://play.google.com/store/apps/details?id='
          'com.vicentecaycedo.cluedetectivenotebook&hl=en_US',
    );

    final apps = await loadTEApps();

    expect(apps.contains(p10sk), isTrue);
    expect(apps.contains(cdn), isTrue);
  });
}
