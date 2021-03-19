//
//  AppDelegate.m
//  网课通教师版
//
//  Created by 约克 on 2021/3/11.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "ClassViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    MainTabBarController * tabBarController = [[MainTabBarController alloc]init];
        
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
