//
//  AppDelegate.m
//  LaunchHelper
//
//  Created by Suhas Sharma on 02/10/12.
//  Copyright (c) 2012 Suhas Sharma. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    NSString *appPath = [[[[[[NSBundle mainBundle] bundlePath]
                            stringByDeletingLastPathComponent]
                           stringByDeletingLastPathComponent]
                          stringByDeletingLastPathComponent]
                         stringByDeletingLastPathComponent];
    NSLog(@"Launching %@", appPath);
    
    [[NSWorkspace sharedWorkspace] launchApplication:appPath];
        
    [NSApp terminate:nil];
}

@end
