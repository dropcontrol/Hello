//
//  HelloAppDelegate.m
//  Hello
//
//  Created by hiroshi yamato on 4/26/13.
//  Copyright (c) 2013 Alliance Port, LLC. All rights reserved.
//
//  update 5/10

#import "HelloAppDelegate.h"
#import "HelloViewController.h"
#import "SecondViewController.h"

@implementation HelloAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Windowを用意してる。
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    // 用意したwindowに乗せる、ViewControllerを初期化して用意してます。
    UIViewController *helloViewController = [[HelloViewController alloc] initWithNibName:nil bundle:nil];

    // 二つ目のViewControllerであるところの、SecondViewControllerを初期化して用意してあげましょう。
    UIViewController *secondViewController = [[SecondViewController alloc] init];
    
    // NSArrayの生成（Xcode 4.4）
    // NSArray *colors = @[@"Orange", @"Yellow", @"Green"]; // nilは不要！
    NSArray *tabBarControllers = @[helloViewController, secondViewController];

    // 上で渡しちゃったので、hellViewControllerは用済みなのでリリースします。
    [helloViewController release];
    [secondViewController release];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:tabBarControllers animated:NO];
    
    // helloViewControllerをwindowのrootViewControllerにわたします。
    self.window.rootViewController = tabBarController;
    [tabBarController release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
