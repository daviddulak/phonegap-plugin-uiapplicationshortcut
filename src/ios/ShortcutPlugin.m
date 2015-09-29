#import "ShortcutPlugin.h"

@implementation ShortcutPlugin

@synthesize callbackId;
@synthesize callback;

- (void)sendResult:(NSString*)shortcut {
    if (self.callbackId != nil)
    {
        CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:shortcut];
        [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
    }
}

@end
