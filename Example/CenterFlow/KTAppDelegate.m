//
//  AppDelegate.m
//  CenterFlow
//
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//

#import "KTAppDelegate.h"
#import "KTBasicCollectionViewController.h"
#import "KTVariableHeightCollectionViewController.h"
#import "KTSelfSizingCollectionViewController.h"
#import "KTCenterFlowLayout.h"

@interface KTAppDelegate ()

@end

@implementation KTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
  
    UINavigationController *basicNavController = [UINavigationController new];
    basicNavController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    basicNavController.tabBarItem.title = @"Basic";
    KTBasicCollectionViewController *basicController = [[KTBasicCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    [basicNavController setViewControllers:@[basicController]];
    
    UINavigationController *heightsNavController = [UINavigationController new];
    heightsNavController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
    heightsNavController.tabBarItem.title = @"Variable Heights";
    KTVariableHeightCollectionViewController *heightsController = [[KTVariableHeightCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    [heightsNavController setViewControllers:@[heightsController]];
    
    UINavigationController *selfsizeNavController = [UINavigationController new];
    selfsizeNavController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:2];
    selfsizeNavController.tabBarItem.title = @"Self Sizing";
    KTSelfSizingCollectionViewController *selfsizeController = [[KTSelfSizingCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    [selfsizeNavController setViewControllers:@[selfsizeController]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[basicNavController, heightsNavController, selfsizeNavController]];
    
    self.window.rootViewController = tabBarController;
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
