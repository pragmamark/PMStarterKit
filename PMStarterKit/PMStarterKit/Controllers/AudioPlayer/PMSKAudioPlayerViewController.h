//
//  PMSKAudioPlayerViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 12/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PMSKAudioPlayerViewController : UIViewController<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;
@property (retain, nonatomic) IBOutlet UISlider *slider;

- (IBAction)playButtonTouched:(id)sender;
- (IBAction)pauseButtonTouched:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;

@end
