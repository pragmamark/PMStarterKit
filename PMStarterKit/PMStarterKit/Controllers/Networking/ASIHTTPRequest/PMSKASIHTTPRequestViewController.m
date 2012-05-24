//
//  PMSKASIHTTPRequestViewController.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/24/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKASIHTTPRequestViewController.h"

@interface PMSKASIHTTPRequestViewController ()

@property (retain, nonatomic) ASIHTTPRequest *request;

@end

@implementation PMSKASIHTTPRequestViewController


#pragma mark - View Lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setTextView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark - Memory Management

- (void)dealloc 
{
    [_request clearDelegatesAndCancel];
    [_request release];
    [_textView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - Action Methods

- (IBAction)getAppleTouched:(id)sender 
{
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
    self.request = request;
    self.request.delegate = self;
    [self.request startAsynchronous];
    [request release];
}



#pragma ASIHTTPRequestDelegate Methods

- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"requestStarted: %@", request.url.absoluteString);
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"requestFinished: %@", request.url.absoluteString);
    self.textView.text = request.responseStatusMessage;
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed: %@", request.url.absoluteString);
}



#pragma mark - Properties

@synthesize request = _request;
@synthesize textView = _textView;

@end
