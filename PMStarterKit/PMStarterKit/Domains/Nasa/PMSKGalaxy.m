//
//  PMSKGalaxy.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKGalaxy.h"

@interface PMSKGalaxy ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSArray *planets;

@end

@implementation PMSKGalaxy


- (id)initWithName:(NSString *)name
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
    }
    
    return self;
}

- (void)dealloc
{
    [_name release];
    [_planets release];
    [super dealloc];
}



#pragma mark - Properties

@synthesize name    = _name;
@synthesize planets  = _planets;

@end
