
 #import "AppDelegate+shortcut.h"
 #import "ShortcutPlugin.h"
 #import <objc/message.h>
 #import <objc/runtime.h>

@implementation AppDelegate (shortcut)


+ (void)load
{
    Method original, swizzled;

    original = class_getInstanceMethod(self, @selector(setDelegate:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_setDelegate:));

    method_exchangeImplementations(original, swizzled);
}


- (void)swizzled_setDelegate:(id<UIApplicationDelegate>)delegate
{
    Method original, swizzled;

    IMP implementation = class_getMethodImplementation([self class], @selector(swizzled_application:didFinishLaunchingWithOptions:));
    class_addMethod([delegate class], @selector(swizzled_application:didFinishLaunchingWithOptions:), implementation, "B@:@@");

    original = class_getInstanceMethod([delegate class], @selector(application:didFinishLaunchingWithOptions:));
    swizzled = class_getInstanceMethod([delegate class], @selector(swizzled_application:didFinishLaunchingWithOptions:));

    method_exchangeImplementations(original, swizzled);

    [self swizzled_setDelegate: delegate];
}


- (BOOL)swizzled_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIApplicationShortcutItem* shortcutItem = launchOptions[UIApplicationLaunchOptionsShortcutItemKey];
    NSLog(@"swizzled_app: %@", [shortcutItem type]);

    SEL realSelector =  @selector(swizzled_application:didFinishLaunchingWithOptions:);
    return (BOOL) objc_msgSend([application delegate], realSelector, application, launchOptions);
}

- (void)actOnShortcut:(NSString *)shortcut
{
    if (shortcut)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:shortcut forKey:@"Shortcut"];
        [defaults synchronize];
    }
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {

    NSString * shortcut = [shortcutItem type];
    NSLog(@"app: %@", shortcut);

    if (shortcut)
    {
        ShortcutPlugin *plugin = [self.viewController getCommandInstance:@"ShortcutPlugin"];
        //[[[ShortcutPlugin alloc] init] setResult:shortcut];
        [plugin setResult:shortcut];
    }
}




@end
