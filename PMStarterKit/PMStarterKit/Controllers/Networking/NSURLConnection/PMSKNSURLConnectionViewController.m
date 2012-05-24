//
//  PMSKNSURLConnectionViewController.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/24/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKNSURLConnectionViewController.h"

@interface PMSKNSURLConnectionViewController ()

@end

@implementation PMSKNSURLConnectionViewController

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
    
    self.navigationItem.title = @"NSURLConnection";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
