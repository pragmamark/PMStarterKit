//
//  PMSKDesignPatternViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 13/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKDesignPatternViewController.h"
#import "PMSKTempViewController.h"

@interface PMSKDesignPatternViewController ()

@end

@implementation PMSKDesignPatternViewController

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
    
    [self.targetActionButton addTarget:self action:@selector(_targetActionButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_targetActionButton release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setTargetActionButton:nil];
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Private methods

- (void) _targetActionButtonTouched:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WOW"
                                                    message:@"Target action button pressed!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    
    [alert show];
    
    [alert release];
}

- (void)tic:(NSTimer *)timer
{
    NSLog(@"%@ Post notification!", NSStringFromSelector(_cmd));
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kTestNotification" object:nil];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)delegationButtonTouched:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ATTENZIONE"
                                                    message:@"Messaggio di prova"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    
    [alert show];
    
    [alert release];
}

- (IBAction)notificationButtonTouched:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(tic:) userInfo:nil repeats:NO];
    
    PMSKTempViewController *tempController = [[PMSKTempViewController alloc] initWithNibName:@"PMSKTempViewController" bundle:nil];
    
    [self.navigationController pushViewController:tempController animated:NO];
    
    [tempController release];
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@ UIAlertView Closed", NSStringFromSelector(_cmd));
}

@end
