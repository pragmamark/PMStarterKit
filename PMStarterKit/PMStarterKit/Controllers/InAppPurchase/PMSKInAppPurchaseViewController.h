//
//  PMSKInAppPurchaseViewController.h
//  PMStarterKit
//
//  Created by Stefano Zanetti on 11/12/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface PMSKInAppPurchaseViewController : UIViewController<SKProductsRequestDelegate, SKPaymentTransactionObserver, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) SKProductsRequest *request;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
