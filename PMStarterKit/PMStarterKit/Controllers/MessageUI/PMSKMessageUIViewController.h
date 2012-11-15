//
//  PMSKMessageUIViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 12/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PMSKMessageUIViewController : UIViewController<MFMailComposeViewControllerDelegate>

- (IBAction)sendEmailButtonTouched:(id)sender;

@end
