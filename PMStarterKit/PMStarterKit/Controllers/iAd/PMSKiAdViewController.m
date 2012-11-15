//
//  PMSKiAdViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 29/10/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKiAdViewController.h"
#import "PMSKTempViewController.h"

typedef void (^layoutCompletionBlock)(void);

@interface PMSKiAdViewController ()

@end

@implementation PMSKiAdViewController

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

- (void)dealloc
{    
    [_bannerView release];
    [_contentView release];
    
    [super dealloc];
}

- (void)viewDidLoad
{
    _bannerIsVisible = NO;
    
    UIBarButtonItem *pushButton = [[UIBarButtonItem alloc] initWithTitle:@"PUSH"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(_pushButtonTouched:)];
    
    self.navigationItem.rightBarButtonItem = pushButton;
    
    [pushButton release];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self _addiAdView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    [self setContentView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    [self _layoutAnimated:YES completionBlock:^{
       
    }];
    
    return YES;
}

- (BOOL)shouldAutorotate
{    
    return YES;
}

#pragma mark -
#pragma mark Private methods

- (BOOL) _allowActionToRun
{
    return YES;
}

- (void) _removeiAdView:(BOOL)animated
{
    [self _layoutAnimated:animated completionBlock:^{
        [self.bannerView removeFromSuperview];
        self.bannerView.delegate = nil;
        [_bannerView release];
        _bannerView = nil;
        
        NSLog(@"Banner view removed to superview");
    }];
    
}

- (void) _addiAdView
{
    if (!self.bannerView)
    {
        ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, 320, 44)];
        adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
        self.bannerView = adView;
        [adView release];
        
        self.bannerView.delegate = self;
        [self.view addSubview:self.bannerView];
        NSLog(@"Banner view added to superview");
    }
}

- (void) _layoutAnimated:(BOOL)animated completionBlock:(layoutCompletionBlock)block
{
    CGRect contentFrame = self.view.bounds;
    if (contentFrame.size.width < contentFrame.size.height) {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    } else {
        _bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    }
    
    CGRect bannerFrame = _bannerView.frame;
    
    if (!_bannerIsVisible)
    {
        contentFrame.size.height -= _bannerView.frame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
        _bannerIsVisible = YES;
    } else
    {
        bannerFrame.origin.y = contentFrame.size.height;
        _bannerIsVisible = NO;
    }
    
    [UIView animateWithDuration:animated ? 0.25 : 0.0 animations:^{
        _contentView.frame = contentFrame;
        [_contentView layoutIfNeeded];
        _bannerView.frame = bannerFrame;
    }
     completion:^(BOOL finished) {
         block();
     }];
}

- (void) _pushButtonTouched:(id)sender
{
    PMSKTempViewController *tempController = [[[PMSKTempViewController alloc] initWithNibName:@"PMSKTempViewController" bundle:nil] autorelease];
    
    [self _removeiAdView:YES];
    
    [self.navigationController pushViewController:tempController animated:YES];
}

#pragma mark -
#pragma mark ADBannerViewDelegate

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    NSLog(@"Banner view is beginning an ad action");
    BOOL shouldExecuteAction = [self _allowActionToRun]; // your application implements this method
    if (!willLeave && shouldExecuteAction)
    {
        // insert code here to suspend any services that might conflict with the advertisement
    }
    return shouldExecuteAction;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"Banner load");
    
    [self _layoutAnimated:YES completionBlock:^{
        //
    }];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    
    NSLog(@"Banner view fail to laod");
    
    [self _layoutAnimated:YES completionBlock:^{
        
    }];
}

@end
