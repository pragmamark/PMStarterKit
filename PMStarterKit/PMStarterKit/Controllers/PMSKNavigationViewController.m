//
//  PMSKNavigationViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 15/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKNavigationViewController.h"

@interface PMSKNavigationViewController ()

@end

@implementation PMSKNavigationViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

@end
