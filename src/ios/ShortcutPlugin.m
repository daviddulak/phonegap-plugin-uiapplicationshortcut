#import "ShortcutPlugin.h"

@implementation ShortcutPlugin

- (void)check: (CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString *shortcutMessage = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"Shortcut"];
    NSLog(@"SHORTCUT: %@", shortcutMessage);
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:shortcutMessage];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
