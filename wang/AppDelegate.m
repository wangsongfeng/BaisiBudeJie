//
//  AppDelegate.m
//  wang
//
//  Created by abc on 16/9/4.
//  Copyright © 2016年 abc. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "UIDevice+Extension.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //设置导航栏样式
    
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    UIImage *image = [UIImage imageNamed:@"menu_bk_partten"];
//    [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    [navigationBar setTintColor:[[UIColor redColor]colorWithAlphaComponent:0.8]];
//    navigationBar.translucent = NO;
//    navigationBar.titleTextAttributes = @{NSStrokeColorAttributeName: [[UIColor whiteColor]colorWithAlphaComponent:0.8],
//                                          NSFontAttributeName: [UIFont boldSystemFontOfSize:15]
//                                          };
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=[[TabBarViewController alloc]init];
    
    [self.window makeKeyAndVisible];
    NSLog(@"%@",[UIDevice deviceVersion]);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
