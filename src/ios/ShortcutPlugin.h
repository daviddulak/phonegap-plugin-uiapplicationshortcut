#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

//@interface ShortcutPlugin : CDVPlugin {
//    NSString *shortcutMessage;
//}

@interface ShortcutPlugin : CDVPlugin

@property (nonatomic, copy) NSString *shortcutMessage;

- (void)setResult: (NSString*)shortcut;
- (void)check: (CDVInvokedUrlCommand*)command;

@end
