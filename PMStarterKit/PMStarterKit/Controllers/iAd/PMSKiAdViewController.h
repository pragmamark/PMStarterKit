//
//  PMSKiAdViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 29/10/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iAd/iAd.h"

@interface PMSKiAdViewController : UIViewController<ADBannerViewDelegate>

@property (assign, nonatomic) BOOL bannerIsVisible;
@property (retain, nonatomic) IBOutlet UITextView *contentView;
@property (retain, nonatomic) ADBannerView *bannerView;

@end
