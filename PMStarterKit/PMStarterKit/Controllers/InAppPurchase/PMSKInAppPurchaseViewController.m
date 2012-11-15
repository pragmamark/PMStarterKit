//
//  PMSKInAppPurchaseViewController.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 11/12/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKInAppPurchaseViewController.h"
#import "MBProgressHUD.h"

@interface PMSKInAppPurchaseViewController ()

@property (nonatomic, retain) NSSet *productIdentifiers;
@property (nonatomic, retain) NSArray *products;
@property (nonatomic, retain) NSMutableSet *purchasedProducts;

- (void) _buyProductIdentifier:(SKProduct *)product;

@end

@implementation PMSKInAppPurchaseViewController

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
    
    self.productIdentifiers = [NSSet setWithArray:  @[@"001", @"002"]];
    
    if ([SKPaymentQueue canMakePayments])
    {
        [self _requestProducts];
        
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    }
    else
    {
        
    }
    
    UIBarButtonItem *barButton = [[[UIBarButtonItem alloc] initWithTitle:@"Restore"
                                                                  style:UIBarButtonItemStyleBordered
                                                                 target:self
                                                                 action:@selector(_restoreProducts:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = barButton;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    
    [_request cancel];
    [_request release];
    [_productIdentifiers release];
    [_products release];
    [_purchasedProducts release];
    [_tableView release];
    
    [super dealloc];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

#pragma mark -
#pragma mark Private methods

- (void) _requestProducts
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:self.productIdentifiers];
    
    self.request = request;

    [request release];
    
    _request.delegate = self;
    [_request start];
}

- (void) _buyProductIdentifier:(SKProduct *)product
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSLog(@"Buying %@...", product.productIdentifier);
    
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void) _productPurchased:(NSString *)productIdentifier
{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    NSLog(@"Purchased: %@", productIdentifier);
    
    [self.tableView reloadData];
}

- (void) _productPurchaseFailed:(SKPaymentTransaction *)transaction
{    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if (transaction.error.code != SKErrorPaymentCancelled) {
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error!"
                                                         message:transaction.error.localizedDescription
                                                        delegate:nil
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil] autorelease];
        
        [alert show];
    }
}

- (void) _restoreProducts:(id)sender
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void) _recordProduct:(NSString *)productIdentifier
{
    
    NSLog(@"Toggling flag for: %@", productIdentifier);
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [_purchasedProducts addObject:productIdentifier];
    
    
    [self _productPurchased:productIdentifier];
}

- (void) _completeTransaction:(SKPaymentTransaction *)transaction
{
    
    NSLog(@"completeTransaction...");
    
    [self _recordProduct:transaction.payment.productIdentifier];
    [self _recordTransaction: transaction];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    
}

- (void) _failedTransaction:(SKPaymentTransaction *)transaction
{
    
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        NSLog(@"Transaction error: %@", transaction.error.localizedDescription);
    }
    
    [self _productPurchaseFailed:transaction];
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void) _restoreTransaction:(SKPaymentTransaction *)transaction
{
    NSLog(@"restoreTransaction...");
    
    [self _recordProduct:transaction.originalTransaction.payment.productIdentifier];
    [self _recordTransaction: transaction];
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void) _recordTransaction:(SKPaymentTransaction *)transaction
{
    // Optional: Record the transaction on the server side...
}

#pragma mark -
#pragma mark SKProductsRequestDelegate

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
    NSLog(@"%@", NSLocalizedString(@"pragmamark_inapp_purchace_log", nil));
    self.products = response.products;
    
    _request = nil;
    
    [_tableView reloadData];
}

#pragma mark -
#pragma mark SKPaymentTransactionObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                [self _completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                [self _failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                [self _restoreTransaction:transaction];
            default:
                break;
        }
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

#pragma mark -
#pragma mark UITableViewDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_products count];
}

#pragma mark -
#pragma mark UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    SKProduct *product = [_products objectAtIndex:indexPath.row];
    
    BOOL purchased = [[NSUserDefaults standardUserDefaults] boolForKey:product.productIdentifier];
    
    cell.textLabel.text = product.localizedTitle;
    cell.detailTextLabel.text = product.localizedDescription;
    cell.accessoryView.userInteractionEnabled = NO;
    cell.accessoryType = purchased ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self _buyProductIdentifier:[_products objectAtIndex:indexPath.row]];
}

@end
