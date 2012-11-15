//
//  PMSKMyLocation.m
//  PMStarterKit
//
//  Created by Stefano Zanetti on 05/11/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import "PMSKMyLocation.h"

@implementation PMSKMyLocation

- (id)initWithName:(NSString *)name address:(NSString *)address coordinate:(CLLocationCoordinate2D)coordinate
{
    if (self = [super init])
    {
        _name = [name copy];
        _address = [address copy];
        _coordinate = coordinate;
    }
    
    return self;
}

- (NSString *)title {
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown charge";
    else
        return _name;
}

- (NSString *)subtitle {
    return _address;
}

@end
