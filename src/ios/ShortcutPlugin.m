#import "ShortcutPlugin.h"

@implementation ShortcutPlugin

//@synthesize shortcutMessage;

- (void)setResult:(NSString*)shortcut {
    _shortcutMessage = shortcut;
}

- (void)check: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSLog(@"SHORTCUT: %@", _shortcutMessage);
    if (_shortcutMessage != nil) {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:_shortcutMessage];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else {
      pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No shortcut found"];
      [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end
