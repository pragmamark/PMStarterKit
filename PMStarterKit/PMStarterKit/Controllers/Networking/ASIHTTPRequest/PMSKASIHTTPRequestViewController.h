//
//  PMSKASIHTTPRequestViewController.h
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/24/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIHTTPRequest.h"

@interface PMSKASIHTTPRequestViewController : UIViewController <ASIHTTPRequestDelegate>
{
    ASIHTTPRequest  *_request;
    UITextView      *_textView;
}


// Properties
@property (retain, nonatomic) IBOutlet UITextView *textView;


// Action Methods
- (IBAction)getAppleTouched:(id)sender;

@end
