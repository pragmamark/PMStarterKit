//
//  PMSKPlanet.h
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PMSKGalaxy.h"

@interface PMSKPlanet : NSObject
{
    NSString    *_name;
    PMSKGalaxy  *_galaxy;
}

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, retain, readonly) PMSKGalaxy *galaxy;

- (id)initWithName:(NSString *)name galaxy:(PMSKGalaxy *)galaxy;

@end
