//
//  AppDelegate.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTAppDelegate.h"
#import "KTMainController.h"
#import "KTCenterFlowLayout.h"

@interface KTAppDelegate ()

@end

@implementation KTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  UINavigationController *navController = [UINavigationController new];
  
  KTMainController *mainController = [[KTMainController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
  navController.viewControllers = @[mainController];
    
  self.window.rootViewController = navController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
