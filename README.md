##UIApplicationShortcutItem Plugin


This plugin adds cordova iOS support to handle iOS9 3d Touch icon shortcuts.




__Add the plugin__

cordova plugin add https://github.com/daviddulak/phonegap-plugin-uiapplicationshortcut.git




__Configure Shortcuts__

edit `cordova/plugins/ios.json` to your desired shortcuts




__Check for the Occurance__

window.plugins.shortcut.check(function(e){
  if (e === 'com.string') {
    console.log('Success');
  }
});