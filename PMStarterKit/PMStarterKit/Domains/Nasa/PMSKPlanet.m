//
//  PMSKPlanet.m
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKPlanet.h"

@interface PMSKPlanet ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) PMSKGalaxy *galaxy;

@end

@implementation PMSKPlanet


- (id)initWithName:(NSString *)name galaxy:(PMSKGalaxy *)galaxy
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
        self.galaxy = galaxy;
    }
    
    return self;
}

- (void)dealloc
{
    [_name release];
    [_galaxy release];
    [super dealloc];
}



#pragma mark - Properties

@synthesize name    = _name;
@synthesize galaxy  = _galaxy;

@end
