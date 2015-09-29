#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface ShortcutPlugin : CDVPlugin

@property (nonatomic, copy) NSString *callbackId;
@property (nonatomic, copy) NSString *callback;

- (void)sendResult:(NSString*)shortcut;

@end
