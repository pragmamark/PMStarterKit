//
//  PMSKHomeViewController.h
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/24/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMSKHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray     *_elements;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
