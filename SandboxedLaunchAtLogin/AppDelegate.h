//
//  AppDelegate.h
//  SandboxedLaunchAtLogin
//
//  Created by Suhas Sharma on 02/10/12.
//  Copyright (c) 2012 Suhas Sharma. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSButton *launchAtLoginCheckbox;
- (IBAction)toggleLaunchAtLogin:(id)sender;

@end
