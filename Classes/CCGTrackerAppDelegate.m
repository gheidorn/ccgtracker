//
//  CCGTrackerAppDelegate.m
//  CCGTracker
//
//  Created by Greg Heidorn on 3/22/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "CCGTrackerAppDelegate.h"
#import "CardSetTableViewController.h"

@implementation CCGTrackerAppDelegate

@synthesize navController;
@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	CardSetTableViewController *controller = [[CardSetTableViewController alloc] initWithStyle:UITableViewStylePlain];
	navController = [[UINavigationController alloc] initWithRootViewController:controller];
	[controller release];
	
    [window addSubview:[navController view]];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [navController release];
    [window release];
    [super dealloc];
}

@end