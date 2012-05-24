//
//  PMSKGalaxy.h
//  PMStarterKit
//
//  Created by Massimo Oliviero on 5/25/12.
//  Copyright (c) 2012 pragmamark.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMSKGalaxy : NSObject
{
    NSString *_name;
    NSArray  *_planets;
}

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, retain, readonly) NSArray *planets;

- (id)initWithName:(NSString *)name;

@end
