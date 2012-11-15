//
//  PMSKMessageUIViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 12/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKMessageUIViewController.h"

@interface PMSKMessageUIViewController ()

@end

#pragma mark -
#pragma mark View life cycle

@implementation PMSKMessageUIViewController

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

#pragma mark -
#pragma mark IBActions

- (IBAction)sendEmailButtonTouched:(id)sender
{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    
    mc.mailComposeDelegate = self;
    [mc setSubject:@"Nuovo messaggio"];
    
    [mc setMessageBody:@"Ecco come si manda una email." isHTML:NO];
    [mc setMessageBody:@"<p>Ecco come si manda una email.<p>" isHTML:YES];
    
    [mc setToRecipients:[NSArray arrayWithObjects:@"indirizzo1@pragmamark.org", @"indirizzo2@pragmamark.org", nil]];
    [mc setCcRecipients:[NSArray arrayWithObject:@"indirizzo3@pragmamark.org"]];
    [mc setBccRecipients:[NSArray arrayWithObject:@"indirizzo4@pragmamark.org"]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"allegato" ofType:@"png"];
    NSData *imageData = [NSData dataWithContentsOfFile:path];
    [mc addAttachmentData:imageData mimeType:@"image/png" fileName:@"allegato"];

    [mc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    
    [self presentModalViewController:mc animated:YES];
    
    [mc release];
}

#pragma mark -
#pragma mark MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    // switchng the result
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled.");
            /*
             Execute your code for canceled event here ...
             */
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved.");
            /*
             Execute your code for email saved event here ...
             */
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent.");
            /*
             Execute your code for email sent event here ...
             */
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send error: %@.", [error localizedDescription]);
            /*
             Execute your code for email send failed event here ...
             */
            break;
        default:
            break;
    }
    // hide the modal view controller
    [self dismissModalViewControllerAnimated:YES];
}

@end
