#import "AppDelegate.h"
#import "ExampleView.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSApp activateIgnoringOtherApps:YES];
    NSRect frame = [self.window.contentView frame];
    ExampleView *view = [[ExampleView alloc] initWithFrame:frame];
    [self.window.contentView addSubview:view];
}

@end
