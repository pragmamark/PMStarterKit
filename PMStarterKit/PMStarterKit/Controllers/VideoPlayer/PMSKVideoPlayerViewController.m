//
//  PMSKVideoPlayerViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 11/14/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKVideoPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PMSKVideoPlayerViewController ()

@end

@implementation PMSKVideoPlayerViewController

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
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark -
#pragma mark IBActions

- (IBAction)playButtonTouched:(id)sender
{
    // Aggiungere nelle risorse del progetto un file m4v nominato "filevideo.m4v".
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"filevideo" ofType:@"m4v"];
    
    MPMoviePlayerViewController *controller = [[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]] autorelease];
    
    controller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    
    [self presentModalViewController:controller animated:YES];
}

@end
