//
//  PMSKLocalNotificationViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 05/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMSKLocalNotificationViewController : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *messageTextField;
@property (retain, nonatomic) IBOutlet UIDatePicker *datePickerView;
@property (retain, nonatomic) IBOutlet UIButton *scheduleNotificationButton;

- (IBAction)scheduleNotificationButtonTouched:(id)sender;

@end
