//
//  PMSKDesignPatternViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 13/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMSKDesignPatternViewController : UIViewController<UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UIButton *targetActionButton;

- (IBAction)delegationButtonTouched:(id)sender;
- (IBAction)notificationButtonTouched:(id)sender;

@end
