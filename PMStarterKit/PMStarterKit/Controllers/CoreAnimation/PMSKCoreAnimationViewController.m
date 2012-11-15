//
//  PMSKCoreAnimationViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 11/14/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKCoreAnimationViewController.h"
#import <QuartzCore/QuartzCore.h>

#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface PMSKCoreAnimationViewController ()

@end

@implementation PMSKCoreAnimationViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UIView *sampleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    sampleView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:sampleView];
    
    
//    Primo metodo
//
    
//    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
//
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
//    anim.toValue    = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//
//    anim.duration   = 3.0;
//    anim.removedOnCompletion = YES;
//
//    sampleView.layer.position = CGPointMake(200, 200);
//
//    [sampleView.layer addAnimation:anim forKey:@"animatePosition"];
//
    
//    Secondo metodo
//
    
    [UIView animateWithDuration:3.0 animations:^{
        sampleView.frame = CGRectMake(150, 150, 50, 50);
        
        CGAffineTransform transform =
        CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0));
        sampleView.transform = CGAffineTransformScale(transform,.5,.5);
    }
     completion:^(BOOL finished) {
         NSLog(@"Animazione termianata");
     }];
    
    
//    Terzo metodo
//
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:3.0];
//    sampleView.frame = CGRectMake(150, 150, 50, 50);
//    
//    CGAffineTransform transform =
//    CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0));
//    sampleView.transform = CGAffineTransformScale(transform,.5,.5);
//    
//    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
