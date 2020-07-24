import 'package:flutter_test/flutter_test.dart';
import 'package:vc_related_apps/vc_related_apps.dart';

void main() {
  test('related apps are correctly downloaded', () async {
    // Test depends on current json hosted online.
    // Not worth the trouble of mocking data, etc.
    // Test last updated: 07/23/20.
    final p10sk = App(
      id: 'com.vicentecaycedo.phase10scorekeeper',
      title: 'Phase 10 Score Keeper',
      description: 'The ultimate companion app for the Phase 10 card game.'
          ' Easily keep track of phases and points!',
      iconUrl: 'https://vicentecaycedo.com/apps/icons/p10sk.png',
      appStore: 'https://apps.apple.com/us/app/id1257116642',
      playStore: 'https://play.google.com/store/apps/details?'
          'id=com.vicentecaycedo.phase10scorekeeper&hl=en_US',
    );
    final cdn = App(
      id: 'com.vicentecaycedo.cluedetectivenotebook',
      title: 'Clue Detective Notebook',
      description: 'The ultimate companion app for Clue - the Classic Murder '
          'Mystery Game.',
      iconUrl: 'https://vicentecaycedo.com/apps/icons/cdn.png',
      appStore: 'https://apps.apple.com/us/app/clue-detective-notebook'
          '/id1330273449',
      playStore: 'https://play.google.com/store/apps/details?id='
          'com.vicentecaycedo.cluedetectivenotebook&hl=en_US',
    );

    final apps = await loadRelatedApps();

    expect(apps.contains(p10sk), isTrue);
    expect(apps.contains(cdn), isTrue);
  });
}
