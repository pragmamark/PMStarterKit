//
//  PMSKHomeViewController.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/24/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKHomeViewController.h"


@interface PMSKHomeViewController ()

@property (retain, nonatomic) NSArray *elements;

@end


@implementation PMSKHomeViewController



#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Home";
    
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"ViewControllers" ofType:@"plist"];
    self.elements = [NSArray arrayWithContentsOfFile:filename];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return YES;
}

#pragma mark - Memory Management

- (void)dealloc 
{
    [_tableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.elements.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    
    if (nil == cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    NSDictionary *element = [self.elements objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [element objectForKey:@"name"];
    cell.detailTextLabel.text = [element objectForKey:@"description"];
    
    return cell;
}



#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *element = [self.elements objectAtIndex:indexPath.row];
    NSString *className = [element objectForKey:@"class"];
    UIViewController *controller = [[NSClassFromString(className) alloc] init];
    controller.title = [element objectForKey:@"name"];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}



#pragma mark - Properties

@synthesize tableView   = _tableView;
@synthesize elements    = _elements;

@end
