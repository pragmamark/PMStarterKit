//
//  PMSKAppDelegate.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/22/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKAppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "PMSKNavigationViewController.h"
//#import <AudioToolbox/AudioToolbox.h>

@implementation PMSKAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSError *setCategoryErr = nil;
    NSError *activationErr  = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:&setCategoryErr];
    [[AVAudioSession sharedInstance] setActive:YES error:&activationErr];
    
// 2. Changing the default output audio route
//    UInt32 doChangeDefaultRoute = 1;
//    AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker, sizeof(doChangeDefaultRoute), &doChangeDefaultRoute);
    
    // Init navigation controller
    PMSKHomeViewController *rootController = [[PMSKHomeViewController alloc] init];
    PMSKNavigationViewController *navController = [[[PMSKNavigationViewController alloc] initWithRootViewController:rootController] autorelease];
    [rootController release];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    application.applicationIconBadgeNumber = 0;
    
    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (localNotification)
    {
        NSLog(@"Recieved Notification %@",localNotification);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Local Notification" message:[localNotification.userInfo objectForKey:@"Chiave"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [alert release];
        
        [application cancelLocalNotification:localNotification];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"Recieved Notification %@",notification);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Local Notification" message:[notification.userInfo objectForKey:@"Chiave"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    [alert release];
    
    [application cancelLocalNotification:notification];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%@", NSStringFromSelector(_cmd));

//    bgTask = [application beginBackgroundTaskWithExpirationHandler:^{
//        [application endBackgroundTask: bgTask];
//        bgTask = UIBackgroundTaskInvalid;
//    }];
//    
//    // Start the long-running task and return immediately.
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        int count = 0;
//        
//        for (count = 0; count < 10; count++)
//        {
//            NSLog(@"Ciclo %d: ", count);
//            NSLog(@"Tempo rimanente: %f", application.backgroundTimeRemaining);
//            sleep(4);
//        }
//       
//         NSLog(@"Task completato");
//        
//        [application endBackgroundTask:bgTask];
//        bgTask = UIBackgroundTaskInvalid;
//    });
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
