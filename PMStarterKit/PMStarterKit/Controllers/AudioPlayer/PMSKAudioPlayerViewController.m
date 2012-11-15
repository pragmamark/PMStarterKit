//
//  PMSKAudioPlayerViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 12/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKAudioPlayerViewController.h"

@interface PMSKAudioPlayerViewController ()

@property (nonatomic, retain) NSTimer *playerTimer;

@end

@implementation PMSKAudioPlayerViewController

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
    
    // Aggiungere nelle risorse del progetto un file m4a nominato "fileaudio.m4a".

    NSString *path = [[NSBundle mainBundle] pathForResource:@"fileaudio" ofType:@"m4a"];

    self.view.userInteractionEnabled = NO;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSError *error = nil;
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]
                                                         error:&error];
        [_player prepareToPlay];
        
        //sleep(3);
        
        if( error )
        {
            NSLog(@"Failed with reason: %@", [error localizedDescription]);
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"Duration: %f", [_player duration]);
                _slider.maximumValue = [_player duration];
                _slider.value = 0.0;
                
                _player.delegate = self;

                self.view.userInteractionEnabled = YES;
            });
        }
    });
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [_playerTimer invalidate];
}

- (void)dealloc
{
    [_player stop];
    _player.delegate = nil;

    [_player release];
    [_slider release];
    [_playerTimer release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [self setSlider:nil];
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Private methods

- (void) _updateTime:(NSTimer *)timer
{
    NSLog(@"Current Time: %f", [_player currentTime]);
    _slider.value = [_player currentTime];
}

#pragma mark -
#pragma mark IBActions

- (IBAction)playButtonTouched:(id)sender
{
    [_playerTimer invalidate];
    
    [_player play];
    
    self.playerTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(_updateTime:) userInfo:nil repeats:YES];
}

- (IBAction)pauseButtonTouched:(id)sender
{
    [_playerTimer invalidate];
    
    [_player pause];
}

- (IBAction)sliderValueChanged:(id)sender
{
    [_playerTimer invalidate];
    
    [_player stop];
    [_player setCurrentTime:_slider.value];
    [_player prepareToPlay];
    [_player play];
    
    self.playerTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(_updateTime:) userInfo:nil repeats:YES];
}

#pragma mark -
#pragma mark AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [_playerTimer invalidate];
    [_player setCurrentTime:0.0];
    [_player prepareToPlay];    
}

@end
