//
//  AppDelegate.m
//  Video
//
//  Created by Gavin Guinane on 9/7/16.
//  Copyright © 2016 Gavin Guinane. All rights reserved.
//

#import "AppDelegate.h"
#import "ETPush.h"
@interface AppDelegate ()

@end

static NSString *kETAppID_Debug       = @"Debug_AppID_From_MarketingCloud_App_Centre"; // uses Sandbox APNS for debug builds
static NSString *kETAccessToken_Debug = @"Debug_AccessToken_From_MarketingCloud_App_Centre";
static NSString *kETAppID_Prod        = @"Prod_AppID_From_MarketingCloud_App_Centre";       // uses Production APNS
static NSString *kETAccessToken_Prod  = @"Prod_AccessToken_From_MarketingCloud_App_Centre";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL successful = NO;
    NSError *error = nil;
    
    #ifdef DEBUG
        // Set to YES to enable logging while debugging
        [ETPush setETLoggerToRequiredState:YES];
    
        // configure and set initial settings of the JB4ASDK
        successful = [[ETPush pushManager] configureSDKWithAppID:kETAppID_Debug
                                              andAccessToken:kETAccessToken_Debug
                                               withAnalytics:YES
                                         andLocationServices:YES       // ONLY SET TO YES IF PURCHASED AND USING GEOFENCE CAPABILITIES
                                        andProximityServices:NO       // ONLY SET TO YES IF YOU ARE PART OF THE BEACON BETA PROGRAM
                                               andCloudPages:NO       // ONLY SET TO YES IF PURCHASED AND USING CLOUDPAGES
                                             withPIAnalytics:YES
                                                       error:&error];
    
    NSLog(@"in DEBUG");
    #else
        // configure and set initial settings of the JB4ASDK
        successful = [[ETPush pushManager] configureSDKWithAppID:kETAppID_Prod
                                              andAccessToken:kETAccessToken_Prod
                                               withAnalytics:YES
                                         andLocationServices:YES       // ONLY SET TO YES IF  AND USING GEOFENCE CAPABILITIES
                                        andProximityServices:YES       // ONLY SET TO YES IF YOU ARE PART OF THE BEACON BETA PROGRAM
                                               andCloudPages:YES       // ONLY SET TO YES IF PURCHASED AND USING CLOUDPAGES
                                             withPIAnalytics:YES
                                                       error:&error];
    
        NSLog(@"Not in DEBUG");
    
    #endif
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
