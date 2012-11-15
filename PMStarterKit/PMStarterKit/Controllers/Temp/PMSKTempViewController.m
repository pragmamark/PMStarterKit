//
//  PMSKTempViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 29/10/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKTempViewController.h"

@interface PMSKTempViewController ()

@end

@implementation PMSKTempViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_testNotificationReceived:) name:@"kTestNotification" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

#pragma mark -
#pragma mark Private methods

- (void) _testNotificationReceived:(NSNotification *)notification
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ATTENZIONE"
                                                    message:@"Notifica broadcast ricevuta"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];
    
    [alert release];
}



@end
