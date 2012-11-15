//
//  PMSKLocalNotificationViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 05/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKLocalNotificationViewController.h"

@interface PMSKLocalNotificationViewController ()

@end

@implementation PMSKLocalNotificationViewController

#pragma mark -
#pragma mark View life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_messageTextField release];
    [_scheduleNotificationButton release];
    [_datePickerView release];
    
    [super dealloc];
}
- (void)viewDidUnload
{
    [self setMessageTextField:nil];
    [self setScheduleNotificationButton:nil];
    [self setDatePickerView:nil];
    
    [super viewDidUnload];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)scheduleNotificationButtonTouched:(id)sender
{
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    [localNotification setFireDate:[NSDate dateWithTimeIntervalSinceNow:[_datePickerView countDownDuration]]];
    [localNotification setAlertAction:@"Apri"];
    [localNotification setAlertBody:_messageTextField.text];
    [localNotification setHasAction: YES];
    [localNotification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]+1];
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:_messageTextField.text forKey:@"Chiave"];
    localNotification.userInfo = infoDict;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [localNotification release];
}

#pragma mark -
#pragma mark UItextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
