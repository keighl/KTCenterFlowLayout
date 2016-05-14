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
    basicNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vanilla" image:[UIImage imageNamed:@"tabbar-image"] tag:2];
    KTBasicCollectionViewController *basicController = [[KTBasicCollectionViewController alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    basicController.title = @"UICollectionViewFlowLayout";
    [basicNavController setViewControllers:@[basicController]];
    
    UINavigationController *centerNavController = [UINavigationController new];
    KTBasicCollectionViewController *centerController = [[KTBasicCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    centerController.title = @"KTCenterFlowLayout";
    centerNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Centered" image:[UIImage imageNamed:@"tabbar-image"] tag:2];
    [centerNavController setViewControllers:@[centerController]];
    
    UINavigationController *heightsNavController = [UINavigationController new];
    heightsNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Variable Height" image:[UIImage imageNamed:@"tabbar-image"] tag:1];
    KTVariableHeightCollectionViewController *heightsController = [[KTVariableHeightCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    heightsController.title = @"Variable Height";
    [heightsNavController setViewControllers:@[heightsController]];
    
    UINavigationController *selfsizeNavController = [UINavigationController new];
    selfsizeNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Self Sizing" image:[UIImage imageNamed:@"tabbar-image"] tag:2];
    KTSelfSizingCollectionViewController *selfsizeController = [[KTSelfSizingCollectionViewController alloc] initWithCollectionViewLayout:[KTCenterFlowLayout new]];
    selfsizeController.title = @"Self Sizing";
    [selfsizeNavController setViewControllers:@[selfsizeController]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[
                                           basicNavController,
                                           centerNavController,
                                           heightsNavController,
                                           //selfsizeNavController
                                           ]];
    
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
