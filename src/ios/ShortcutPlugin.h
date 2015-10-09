#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface ShortcutPlugin : CDVPlugin
- (void)check: (CDVInvokedUrlCommand*)command;
@end
