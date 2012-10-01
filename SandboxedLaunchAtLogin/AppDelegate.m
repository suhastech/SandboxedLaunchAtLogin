//
//  AppDelegate.m
//  SandboxedLaunchAtLogin
//
//  Created by Suhas Sharma on 02/10/12.
//  Copyright (c) 2012 Suhas Sharma. All rights reserved.
//

#import "AppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation AppDelegate
@synthesize launchAtLoginCheckbox;

+ (void)initialize {
    NSDictionary * defaults = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], @"launchAtLogin",nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    
}

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launchAtLogin"]) {
        [[self launchAtLoginCheckbox] setState:NSOnState];
        
    } else {
        
        [[self launchAtLoginCheckbox] setState:NSOffState];
    }
}

- (IBAction)toggleLaunchAtLogin:(id)sender {
    
    if ([sender state] == NSOffState) {
        [self toggleState:NO];
  
    } else if ([sender state] == NSOnState)  {
        [self toggleState:YES];
    }
    
    
}

- (void) toggleState:(BOOL) state{
    
    // Not calling LSRegisterURL due to sandbox limitation. So, this might sometimes pick up wrong binaries in dev environment. Highly unlikely in production.
    
    if (!SMLoginItemSetEnabled((CFStringRef)@"com.suhastech.LaunchHelper",
                               state)) {
        NSAlert* alert  = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        
        
        [alert setMessageText:@"Couldn't change the 'Launch at login' state"];
        
        [alert beginSheetModalForWindow:[self window] modalDelegate:self didEndSelector:nil contextInfo:nil];
        [alert release];
    } else {
        
        [[NSUserDefaults standardUserDefaults] setBool:state forKey:@"launchAtLogin"];
    }
}

@end
